import 'package:bili_video_tunes/common/api/video_api.dart';
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
  num? start;
  num? end;

  AudioMediaItem(
      {required this.title,
      required this.description,
      required this.coverImageUrl,
      required this.type,
      this.mediaUrl,
      this.bvId,
      this.start,
      this.end});
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

  // 监听播放状态变化
  void listenPlayerState() {
    _audioPlayer.playerStateStream.listen((state) {
      playerState.value = state;

      if (!state.playing) {
        //检查播放模式
        switch (loopModel.value) {
          case LoopMode.off:
          case LoopMode.one:
          case LoopMode.all:
        }
      }
    });
  }

  // 监听播放进度变化
  void listenPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      currentPosition.value = position;
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

  @override
  void onInit() {
    super.onInit();

    listenPlayerLoopModel();
    listenPlayerDuration();
    listenPlayerPosition();
    listenPlayerState();
  }

  // 解析并且播放音乐只允许该类调用
  Future<void> _analysisPlay(AudioMediaItem audioMediaItem) async {
    switch (audioMediaItem.type) {
      case AudioMediaType.video:
        _analysisVideoMusicPlayer(audioMediaItem);
      case AudioMediaType.audio:
        throw Exception("暂未支持");
      case AudioMediaType.cache:
        throw Exception("暂未支持");
      case AudioMediaType.local:
        throw Exception("暂未支持");
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

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  // 播放列表中的下一首歌曲
  void playNext() {
    _audioPlayer.seekToNext();
  }

// 播放列表中的上一首歌曲
  void playPrevious() {
    _audioPlayer.seekToPrevious();
  }

// 播放指定索引的歌曲
  void playAtIndex(int index) {
    _audioPlayer.seek(Duration.zero, index: index);
  }


  // 解析视频音乐
  Future<void> _analysisVideoMusicPlayer(AudioMediaItem audioMediaItem) async {
    final videoInfo =
        await VideoApi.getVideoBaseInfo(bvid: audioMediaItem.bvId!);

    final videoPlayerInfo = await VideoApi.getVideoPlayerDashInfo(
        bvid: audioMediaItem.bvId!, cid: videoInfo.data?.cid);

    if (videoPlayerInfo.code == 0) {
      playerList.add(audioMediaItem);
      playerIndex.value = 0;

      await _player(videoPlayerInfo.data?.dash?.audio
          ?.elementAt(0)
          .backupUrl
          ?.elementAt(0));
    }
  }


  // 播放音乐
  Future<void> _player(String? url) async {
    if (url != null) {
      await pause();
      await _audioPlayer
          .setUrl(url, headers: {userAgent: browserUserAgent, referer: bliUrl});
      await _audioPlayer.play();
    }
  }

}
