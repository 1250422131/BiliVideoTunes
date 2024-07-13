import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/api/video_api.dart';
import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/controller/user_controller.dart';
import 'package:bili_video_tunes/common/model/local/lyric_data.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

/// 务必注意 BiliAudioHandler 本身是不接管解析业务的，当由各个Controller完成。
/// 目前这样只是为了快速实现功能
/// TODO 待分离解析逻辑
class BiliAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer _audioPlayer = AudioPlayer(
    useProxyForRequestHeaders: false, // 关闭代理，否则需要允许明文
  );

  final BiliAudioService _biliAudioService = Get.find<BiliAudioService>();
  final UserController _userController = Get.find();

  // 播放任务列表
  late RxList<AudioMediaItem> _playerList;

  // 播放状态
  late Rx<PlayerState> _playerState;

  // 当前播放进度
  late Rx<Duration> _currentPosition;

  // 总播放进度
  late Rx<Duration?> _totalDuration;

  // 播放指标
  late Rx<int?> _playerIndex;

  // 循环模式
  late Rx<LoopMode> _loopModel;

  // 歌词位置
  late Rx<int> _lyricLineIndex;

  // 歌曲主题
  late Rx<ColorScheme> _audioLightColorScheme =
      (ColorScheme.fromSeed(seedColor: Colors.deepPurple)).obs;

  late Rx<ColorScheme> _audioDarkColorScheme = (ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, brightness: Brightness.dark))
      .obs;

  Rx<AnimationController?> _singleLyricAnimationController = Rx<AnimationController?>(null);


  BiliAudioHandler() {
    // 内部同步
    _playerList = _biliAudioService.playerList;
    _playerState = _biliAudioService.playerState;
    _currentPosition = _biliAudioService.currentPosition;
    _playerIndex = _biliAudioService.playerIndex;
    _totalDuration = _biliAudioService.totalDuration;
    _loopModel = _biliAudioService.loopModel;
    _lyricLineIndex = _biliAudioService.lyricLineIndex;
    _audioDarkColorScheme = _biliAudioService.audioDarkColorScheme;
    _audioLightColorScheme = _biliAudioService.audioLightColorScheme;
    _singleLyricAnimationController = _biliAudioService.singleLyricAnimationController;
    listenPlayerPosition();
    listenPlayerState();
    listenPlayerDuration();
    listenPlayerLoopModel();
    // 打开通知

    if (GetPlatform.isMobile) {
      // 移动端才具有这个功能
      _notifyAudioHandlerAboutPlaybackEvents();
      _listenForDurationChanges();
    }
  }

  void _listenForDurationChanges() {
    _audioPlayer.durationStream.listen((duration) {
      final index = _playerIndex.value;
      final newQueue = queue.value;
      if (index == null || newQueue.isEmpty) return;
      final oldMediaItem = newQueue[index];
      final newMediaItem = oldMediaItem.copyWith(duration: duration);
      newQueue[index] = newMediaItem;
      queue.add(newQueue);
      mediaItem.add(newMediaItem);
    });
  }

  // The most common callbacks:
  @override
  Future<void> play() async {
    if(_biliAudioService.singleLyricAnimationController.value?.value != 0){
      _biliAudioService.singleLyricAnimationController.value?.forward();
    }
    await _audioPlayer.play();
  }

  @override
  Future<void> pause() async {
    _biliAudioService.singleLyricAnimationController.value?.stop();
    await _audioPlayer.pause();
    // // 发布播放心跳
    // postPlayerHeartbeat(playType: 2);
  }

  @override
  Future<void> stop() async {
    _biliAudioService.singleLyricAnimationController.value?.stop();
    await _audioPlayer.stop();
    return super.stop();
  }

  @override
  Future<void> seek(Duration position) async {

    await _audioPlayer.seek(position);
    _singleLyricAnimationController.value?.also((it) {
      final thisPlayer = _playerList[_playerIndex.value!];

      final playerEdTime = (thisPlayer.lyricList?[_lyricLineIndex.value].endTime ?? 0) - position.inSeconds;
      it.value = ( playerEdTime * 1.0 / (thisPlayer.lyricList?[_lyricLineIndex.value].duration ?? 0));
      debugPrint(it.value.toString());
    });

  }

  @override
  Future<void> skipToQueueItem(int index) async {
    if (index < _playerList.length && index >= 0) {
      await _analysisPlay(_playerList[index], mPlayerIndex: index);
    }
  }

  Future<void> deletePlayerAudioByIndex(int index) async {
    queue.value.removeAt(index);

    if (index == _biliAudioService.playerIndex.value) {
      _playerIndex.value = null;
      stop();
    }
    // _playerList.removeAt(index);
  }

  // 监听播放状态变化
  void listenPlayerState() {
    _audioPlayer.playerStateStream.listen((state) {
      _playerState.value = state;

      if (state.processingState == ProcessingState.completed) {
        _lyricLineIndex.value = 0;
        //检查播放模式
        switch (_loopModel.value) {
          case LoopMode.off:
            // 无模式 -> 随机播放
            final randomIndex = Random().nextInt(_playerList.length);
            _analysisPlay(_playerList[randomIndex], mPlayerIndex: randomIndex);
            break;
          case LoopMode.one:
            // 单曲循环
            _playerIndex.value?.also((it) {
              final audioMediaItem = _playerList.elementAt(it);
              _analysisPlay(audioMediaItem, mPlayerIndex: it);
            });
            break;
          case LoopMode.all:
            _playerIndex.value?.also((it) {
              if (it < _playerList.length - 1) {
                // 是否存在下一首
                it = it + 1;
                final audioMediaItem = _playerList.elementAt(it);
                _analysisPlay(audioMediaItem, mPlayerIndex: it);
              } else if (it == _playerList.length - 1) {
                // 从头再来
                it = 0;
                final audioMediaItem = _playerList.elementAt(it);
                _analysisPlay(audioMediaItem, mPlayerIndex: it);
              }
            });
            break;
        }
      }
    });
  }

  // 监听播放进度变化
  void listenPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      if (position.inSeconds != _currentPosition.value.inSeconds) {
        _playerIndex.value?.also((it) {
          if (position.inSeconds % 15 == 0) {
            // 发布播放心跳
            postPlayerHeartbeat(
                playType: position.inSeconds == _totalDuration.value?.inSeconds
                    ? 2
                    : 0);
          }
        });
      }
      // 更新进度
      _currentPosition.value = position;
      // 更新歌词进度
      updateCurrentLine(position.inSeconds);
    });
  }

  // 监听总时长变化
  void listenPlayerDuration() {
    // 订阅总时长的更新
    _audioPlayer.durationStream.listen((duration) {
      _totalDuration.value = duration;
    });
  }

  void listenPlayerLoopModel() {
    _audioPlayer.loopModeStream.listen((model) {
      _loopModel.value = model;
    });
  }

  Future<void> addPlayerAudio(AudioMediaItem audioMediaItem,
      {bool autoPlay = true}) async {
    await _analysisPlay(audioMediaItem, autoPlay: autoPlay);
  }

  void updateCurrentLine(int currentTime) {
    _playerIndex.value?.also((it) {
      final audioItem = _playerList[it];
      final lyricLength = audioItem.lyricList?.length ?? 0;
      // 这里已经判断了 lyricList 绝对的存在
      for (int i = 0; i < lyricLength; i++) {
        if (i < lyricLength - 1) {
          if (currentTime >= audioItem.lyricList!.elementAt(i).starTime &&
              currentTime < audioItem.lyricList!.elementAt(i + 1).starTime) {
            _lyricLineIndex.value = i;
            break;
          }
        } else {
          _lyricLineIndex.value = i;
        }
      }
    });
  }

  // 解析并且播放音乐只允许该类调用
  Future<void> _analysisPlay(AudioMediaItem audioMediaItem,
      {int? mPlayerIndex, bool autoPlay = true}) async {
    switch (audioMediaItem.type) {
      case AudioMediaType.video:
        // 交由解析函数完成处理
        await _analysisVideoMusicPlayer(audioMediaItem,
            mPlayerIndex: mPlayerIndex, autoPlay: autoPlay);
        break;
      case AudioMediaType.audio:
      case AudioMediaType.cache:
      case AudioMediaType.local:
      case AudioMediaType.url:
        throw Exception("暂未支持");
    }
  }

  // 播放列表中的下一首歌曲
  void playNext() {
    _playerIndex.value?.also((it) {
      if (it < _playerList.length - 1) {
        // 心跳推送
        postPlayerHeartbeat(playType: 2);
        it = it + 1;
        _analysisPlay(_playerList[it], mPlayerIndex: it);
      }
    });
  }

// 播放列表中的上一首歌曲
  void playPrevious() {
    _playerIndex.value?.also((it) {
      if (it > 0) {
        // 心跳推送
        postPlayerHeartbeat(playType: 2);
        // 这不会导致playerIndex.value改变
        it = it - 1;
        _analysisPlay(_playerList[it], mPlayerIndex: it);
      }
    });
  }

  // 解析视频音乐
  Future<void> _analysisVideoMusicPlayer(AudioMediaItem audioMediaItem,
      {int? mPlayerIndex, bool autoPlay = true}) async {
    // TODO 这部分代码需要进一步的异常检测，去除!部分。

    final videoInfo =
        await VideoApi.getVideoBaseInfo(bvid: audioMediaItem.bvId!);

    final videoPlayerInfo = await VideoApi.getVideoPlayerDashInfo(
        bvid: audioMediaItem.bvId!, cid: videoInfo.data?.cid);

    if (autoPlay) {
      await _updatePaletteGenerator(audioMediaItem.coverImageUrl);
    }

    final morePlayerInfo = await VideoApi.getMorePlayerInfo(
        bvid: audioMediaItem.bvId!, cid: videoInfo.data!.cid!);

    final lyricList = <LyricData>[];

    // 加载AI字幕，无则不加载
    morePlayerInfo.data?.subtitle?.subtitles
        ?.where((item) => item.aiStatus == 2)
        .forEach((item) async {
      final videoSubtitleInfo = await VideoApi.getVideoSubtitles(
          uri: item.subtitleUrl!.replaceAll("//aisubtitle.hdslb.com", ""));
      videoSubtitleInfo.body?.forEach((item) => lyricList.add(LyricData(
          lyric: (item.content ?? "").replaceAll("♪ ", "").replaceAll(" ♪", ""),
          starTime: item.from!,
          endTime: item.to!,
          duration: item.to! - item.from!)));
    });

    audioMediaItem.lyricList = lyricList;

    if (videoPlayerInfo.code == 0) {
      //检查是否需要切换播放列表
      if (mPlayerIndex != null) {
        _playerIndex.value = mPlayerIndex;
      } else {
        int newPlayIndex = _playerIndex.value ?? 0;

        if (newPlayIndex >= _playerList.length - 1) {
          //在末尾添加
          _playerList.add(audioMediaItem);
          addQueueItem(audioMediaItem.toMediaItem());
          newPlayIndex = _playerList.length - 1;
        } else {
          newPlayIndex++;
          // 否则在下一曲插入
          _playerList.insert(newPlayIndex, audioMediaItem);
          queue.value.insert(newPlayIndex, audioMediaItem.toMediaItem());
        }

        if (autoPlay) {
          _playerIndex.value = newPlayIndex;
        }
      }

      if (autoPlay) {
        await _player(
            videoPlayerInfo.data?.dash?.audio
                ?.elementAt(0)
                .backupUrl
                ?.elementAt(0),
            audioMediaItem.startTime?.toInt());
      }
    }
  }

  // 播放音乐
  Future<void> _player(String? url, int? initialPosition) async {
    if (url != null) {
      await _audioPlayer.setUrl(url,
          headers: {userAgent: browserUserAgent, referer: bliUrl},
          initialPosition: Duration(seconds: initialPosition ?? 0));
      _audioPlayer.play();
    }
  }

  // 更新调色板生成器 可能遭到废弃，因为我们希望这里可以是异步，确保每次打开都有颜色
  Future<void> _updatePaletteGenerator(String imageUrl) async {
    final networkImage = NetworkImage(imageUrl);

    _audioLightColorScheme.value =
        await ColorScheme.fromImageProvider(provider: networkImage,);

    _audioDarkColorScheme.value = await ColorScheme.fromImageProvider(
        provider: networkImage, brightness: Brightness.dark);
  }

  Future<void> playAtIndex(int index) async {
    if (index < _playerList.length && index >= 0) {
      await _analysisPlay(_playerList[index], mPlayerIndex: index);
    }
  }

  void _notifyAudioHandlerAboutPlaybackEvents() {
    _audioPlayer.playbackEventStream.listen((PlaybackEvent event) async {
      final playing = _audioPlayer.playing;

      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          // MediaControl.stop,
          MediaControl.skipToNext,
        ],
        systemActions: const {
          MediaAction.seek,
        },
        androidCompactActionIndices: const [0, 1, 2],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_audioPlayer.processingState]!,
        playing: playing,
        updatePosition: _audioPlayer.position,
        bufferedPosition: _audioPlayer.bufferedPosition,
        speed: _audioPlayer.speed,
        queueIndex: _playerIndex.value,
      ));
    });
  }

  Future<void> postPlayerHeartbeat({int? playType}) async {
    _playerIndex.value?.also((it) {

      final playerData = _playerList.elementAt(it);
      // 必须是BV视频才能这样做
      if (playerData.bvId != null) {
        VideoApi.postPlayerHeartbeat(
            bvid: playerData.bvId,
            startTs: playerData.startTime,
            playedTime: _currentPosition.value.inSeconds,
            playType: playType);
      }
    });
  }

  Future<void> setLoopMode(LoopMode loopMode) async {
    _loopModel.value = loopMode;
    await _audioPlayer.setLoopMode(loopMode);
  }
}
