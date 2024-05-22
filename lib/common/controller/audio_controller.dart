import 'package:bili_video_tunes/common/handler/bili_audio_handler.dart';
import 'package:bili_video_tunes/common/model/local/isar/video_audio_player_task.dart';
import 'package:bili_video_tunes/common/model/local/lyric_data.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:just_audio/just_audio.dart';

enum AudioMediaType { video, audio, cache, local, url }

class AudioMediaItem {
  String title;
  String description;
  String coverImageUrl;
  AudioMediaType type;
  String? mediaUrl;
  String? bvId;

  //设置音频开始和结束时间
  int? startTime;
  int? endTime;

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
      this.startTime = 0,
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
  final BiliAudioService _biliAudioService = Get.find<BiliAudioService>();
  final Isar _isar = Get.find();

  Future<void> loadPlayerHistoryList() async {
    // final playerHistoryList = await UserInfoApi.getPlayerHistoryInfo();
    // // 获取成功
    // if (playerHistoryList.code == 0) {
    //   final mList = <AudioMediaItem>[];
    //
    //   playerHistoryList.data!.list!.asMap().forEach((index, item) {
    //
    //     final playerData = AudioMediaItem(
    //         title: item.title ?? "",
    //         description: item.history?.part ?? "",
    //         coverImageUrl: item.cover ?? "",
    //         type: AudioMediaType.video,
    //         bvId: item.history?.bvid,
    //         startTime: index != 0 ?  item.progress?.toInt() : 0 // 只有第一首保留播放进度！
    //     );
    //
    //
    //     mList.add(playerData);
    //     _biliAudioHandler.addQueueItem(playerData.toMediaItem());
    //
    //   });
    //
    //
    //   _biliAudioService.playerList.addAll(mList);
    //
    //
    //   // 播放最前面的
    //   await playAtIndex(0);
    //   await pause();
    // }

    final mList = await _isar.videoAudioPlayerTasks.where().findAll();
    for (var element in mList) {
      _biliAudioHandler.addQueueItem(element.toAudioMediaItem().toMediaItem());
      _biliAudioService.playerList.add(element.toAudioMediaItem());
    }
    await playAtIndex(0);
    await pause();
  }

  Future<void> addPlayerAudio(AudioMediaItem audioMediaItem,
      {bool autoPlay = true}) async {
    await _biliAudioHandler.addPlayerAudio(audioMediaItem, autoPlay: autoPlay);
    await _isar.writeTxn(() async {
      await _isar.videoAudioPlayerTasks
          .put(audioMediaItem.toVideoAudioPlayerTask());
    });
  }

  Future<void> deletePlayerAudioByIndex(int index) async {
    final item = _biliAudioService.playerList.elementAt(index);
    await _isar.writeTxn(() async {
      await _isar.videoAudioPlayerTasks
          .filter()
          .bvIdEqualTo(item.bvId)
          .deleteAll();
      _biliAudioHandler.deletePlayerAudioByIndex(index);
    });

  }

  void updateCurrentLine(int currentTime) {
    _biliAudioHandler.updateCurrentLine(currentTime);
  }

  Future<void> setLoopMode(LoopMode loopMode) async {
    await _biliAudioHandler.setLoopMode(loopMode);
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

  Future<void> seek(int milliseconds) async {
    await _biliAudioHandler.seek(Duration(milliseconds: milliseconds));
  }

  Future<void> playAtIndex(int index) async {
    await _biliAudioHandler.playAtIndex(index);
  }
}
