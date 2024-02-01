import 'package:bili_video_tunes/common/api/video_api.dart';
import 'package:bili_video_tunes/common/model/local/lyric_data.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../api/api_path.dart';

enum AudioMediaType { video, audio, cache, local, url }

class AudioMediaItem {
  String title;
  String description;
  String coverImageUrl;
  AudioMediaType type;
  String? mediaUrl;
  String? bvId;

  //设置音频开始和结束时间
  num? startTime;
  num? endTime;

  // 歌词模块
  List<LyricData>? lyricList;

  int totalDuration;

  AudioMediaItem(
      {required this.title,
      required this.description,
      required this.coverImageUrl,
      required this.type,
      this.mediaUrl,
      this.bvId,
      this.startTime,
      this.endTime,
      this.lyricList,
      this.totalDuration = 0});
}

/// 音乐播放器核心
/// 本质上是对just_audio的再封装
class AudioController extends GetxController {

  final AudioPlayer _audioPlayer = AudioPlayer(
    useProxyForRequestHeaders: false, // 关闭代理，否则需要允许明文
  );

  // 播放任务列表
  RxList<AudioMediaItem> playerList = <AudioMediaItem>[].obs;

  // 播放状态
  Rx<PlayerState> playerState = PlayerState(false, ProcessingState.idle).obs;

  // 当前播放进度
  Rx<Duration> currentPosition = (Duration.zero).obs;

  // 总播放进度
  Rx<Duration?> totalDuration = Rx<Duration?>(null);

  // 播放指标
  Rx<int?> playerIndex = Rx<int?>(null);

  // 循环模式
  Rx<LoopMode> loopModel = (LoopMode.off).obs;

  // 歌词位置
  Rx<int> lyricLineIndex = 0.obs;

  // 歌曲主题
  Rx<ColorScheme> audioLightColorScheme =
      (ColorScheme.fromSeed(seedColor: Colors.deepPurple)).obs;

  Rx<ColorScheme> audioDarkColorScheme = (ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, brightness: Brightness.dark))
      .obs;

  // 监听播放状态变化
  void listenPlayerState() {
    _audioPlayer.playerStateStream.listen((state) {
      playerState.value = state;

      if (state.processingState == ProcessingState.completed) {
        lyricLineIndex.value = 0;
        //检查播放模式
        switch (loopModel.value) {
          case LoopMode.off:
            // 无模式
            playerIndex.value?.also((it) {
              if (it < playerList.length - 1) {
                // 是否存在下一首
                it = it + 1;
                final audioMediaItem = playerList.elementAt(it);
                _analysisPlay(audioMediaItem, mPlayerIndex: it);
              } else if (it == playerList.length - 1) {
                // 确实播放完了
                currentPosition.value = (Duration.zero);
                playerIndex.value = null;
                stop();
              }
            });
            break;
          case LoopMode.one:
            // 单曲循环
            playerIndex.value?.also((it) {
              final audioMediaItem = playerList.elementAt(it);
              _analysisPlay(audioMediaItem, mPlayerIndex: it);
            });
            break;
          case LoopMode.all:
            playerIndex.value?.also((it) {
              if (it < playerList.length - 1) {
                // 是否存在下一首
                it = it + 1;
                final audioMediaItem = playerList.elementAt(it);
                _analysisPlay(audioMediaItem, mPlayerIndex: it);
              } else if (it == playerList.length - 1) {
                // 从头再来
                it = 0;
                final audioMediaItem = playerList.elementAt(it);
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
      currentPosition.value = position;
      //更新歌词进度
      updateCurrentLine(position.inSeconds);
    });
  }

  // 监听总时长变化
  void listenPlayerDuration() {
    // 订阅总时长的更新
    _audioPlayer.durationStream.listen((duration) {
      totalDuration.value = duration;
    });
  }

  void listenPlayerLoopModel() {
    _audioPlayer.loopModeStream.listen((model) {
      loopModel.value = model;
    });
  }

  Future<void> addPlayerAudio(AudioMediaItem audioMediaItem) async {
    await _analysisPlay(audioMediaItem);
  }

  void updateCurrentLine(int currentTime) {
    playerIndex.value?.also((it) {
      final audioItem = playerList[it];
      final lyricLength = audioItem.lyricList?.length ?? 0;
      // 这里已经判断了 lyricList 绝对的存在
      for (int i = 0; i < lyricLength; i++) {
        if (i < lyricLength - 1) {
          if (currentTime >= audioItem.lyricList!.elementAt(i).starTime &&
              currentTime < audioItem.lyricList!.elementAt(i + 1).starTime) {
            lyricLineIndex.value = i;
            break;
          }
        } else {
          lyricLineIndex.value = i;
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();

    listenPlayerLoopModel();
    listenPlayerDuration();
    listenPlayerPosition();
    listenPlayerState();
  }

  // 解析并且播放音乐只允许该类调用
  Future<void> _analysisPlay(AudioMediaItem audioMediaItem,
      {int? mPlayerIndex}) async {
    switch (audioMediaItem.type) {
      case AudioMediaType.video:
        // 交由解析函数完成处理
        await _analysisVideoMusicPlayer(audioMediaItem,
            mPlayerIndex: mPlayerIndex);
        break;
      case AudioMediaType.audio:
      case AudioMediaType.cache:
      case AudioMediaType.local:
      case AudioMediaType.url:
        throw Exception("暂未支持");
    }
  }

  // 暂停音乐
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  // 停止音乐
  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  // 恢复播放
  Future<void> play() async {
    await _audioPlayer.play();
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  // 播放列表中的下一首歌曲
  void playNext() {
    playerIndex.value?.also((it) {
      if (it < playerList.length - 1) {
        it = it + 1;
        _analysisPlay(playerList[it], mPlayerIndex: it);
      }
    });
  }

// 播放列表中的上一首歌曲
  void playPrevious() {
    playerIndex.value?.also((it) {
      if (it > 0) {
        // 这不会导致playerIndex.value改变
        it = it - 1;
        _analysisPlay(playerList[it], mPlayerIndex: it);
      }
    });
  }

  // 解析视频音乐
  Future<void> _analysisVideoMusicPlayer(AudioMediaItem audioMediaItem,
      {int? mPlayerIndex}) async {
    final videoInfo =
        await VideoApi.getVideoBaseInfo(bvid: audioMediaItem.bvId!);

    final videoPlayerInfo = await VideoApi.getVideoPlayerDashInfo(
        bvid: audioMediaItem.bvId!, cid: videoInfo.data?.cid);

    await _updatePaletteGenerator(audioMediaItem.coverImageUrl);

    final lyricList = [
      LyricData(lyric: "人海里CPMMM", starTime: 1, endTime: 6),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 7, endTime: 13),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 15, endTime: 19),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 22, endTime: 26),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 28, endTime: 35),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 36, endTime: 42),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 43, endTime: 47),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 48, endTime: 50),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 54, endTime: 56),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 60, endTime: 65),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 66, endTime: 71),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 71, endTime: 76),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 78, endTime: 83),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 84, endTime: 89),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 90, endTime: 95),
      LyricData(lyric: "人海里CadfadasdawPMMM", starTime: 96, endTime: 101),
    ];

    audioMediaItem.lyricList = lyricList;

    if (videoPlayerInfo.code == 0) {
      //检查是否需要切换播放列表
      if (mPlayerIndex != null) {
        playerIndex.value = mPlayerIndex;
      } else {
        int newPlayIndex = playerIndex.value ?? 0;
        if (newPlayIndex >= playerList.length - 1) {
          //在末尾添加
          playerList.add(audioMediaItem);
          newPlayIndex = playerList.length - 1;
        } else {
          newPlayIndex++;
        }
        playerIndex.value = newPlayIndex;
      }

      await _player(videoPlayerInfo.data?.dash?.audio
          ?.elementAt(0)
          .backupUrl
          ?.elementAt(0));
    }
  }

  // 播放音乐
  Future<void> _player(String? url) async {
    if (url != null) {
      await _audioPlayer
          .setUrl(url, headers: {userAgent: browserUserAgent, referer: bliUrl});
      await _audioPlayer.play();
    }
  }

  // 更新调色板生成器 可能遭到废弃，因为我们希望这里可以是异步，确保每次打开都有颜色
  Future<void> _updatePaletteGenerator(String imageUrl) async {
    final networkImage = NetworkImage(imageUrl);

    audioLightColorScheme.value =
        await ColorScheme.fromImageProvider(provider: networkImage);

    audioDarkColorScheme.value = await ColorScheme.fromImageProvider(
        provider: networkImage, brightness: Brightness.dark);
  }

  void seek(int seconds) {
    _audioPlayer.seek(Duration(seconds: seconds));
  }

  Future<void> playAtIndex(int index) async {
    if (index < playerList.length && index >= 0) {
      playerIndex.value = 0;
      await _analysisPlay(playerList[index], mPlayerIndex: index);
    }
  }
}
