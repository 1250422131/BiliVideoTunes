import 'package:bili_video_tunes/common/handler/bili_audio_handler.dart';
import 'package:bili_video_tunes/common/model/local/lyric_data.dart';
import 'package:get/get.dart';

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

  @override
  String toString() {
    return 'AudioMediaItem{title: $title, description: $description, coverImageUrl: $coverImageUrl, type: $type, mediaUrl: $mediaUrl, bvId: $bvId, startTime: $startTime, endTime: $endTime, totalDuration: $totalDuration}';
  }
}

/// 音乐播放器核心
/// 本质上是对just_audio的再封装
class AudioController extends GetxController {
  final BiliAudioHandler _biliAudioHandler = Get.find<BiliAudioHandler>();

  Future<void> addPlayerAudio(AudioMediaItem audioMediaItem) async {
    await _biliAudioHandler.addPlayerAudio(audioMediaItem);
  }

  void updateCurrentLine(int currentTime) {
    _biliAudioHandler.updateCurrentLine(currentTime);
  }

  // 暂停音乐
  Future<void> pause() async {
    await _biliAudioHandler.pause();
  }

  // 停止音乐
  Future<void> stop() async {
    await _biliAudioHandler.stop();
  }

  // 恢复播放
  Future<void> play() async {
    await _biliAudioHandler.play();
  }

  // 播放列表中的下一首歌曲
  void playNext() {
    _biliAudioHandler.playNext();
  }

// 播放列表中的上一首歌曲
  void playPrevious() {
    _biliAudioHandler.playPrevious();
  }

  Future<void> seek(int seconds) async {
    await _biliAudioHandler.seek(Duration(seconds: seconds));
  }

  Future<void> playAtIndex(int index) async {
    await _biliAudioHandler.playAtIndex(index);
  }
}
