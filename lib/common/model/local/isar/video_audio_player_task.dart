import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:isar/isar.dart';

part 'generate/video_audio_player_task.g.dart';

@collection
class VideoAudioPlayerTask {
  Id id = Isar.autoIncrement;

  final String title;
  final String description;
  final String coverImageUrl;

  @enumerated
  final AudioMediaType type;

  String? mediaUrl;
  String? bvId;

  //设置音频开始和结束时间
  int? startTime;
  int? endTime;

  final int totalDuration;

  VideoAudioPlayerTask(
      {required this.title,
      this.mediaUrl,
      this.bvId,
      this.startTime,
      this.endTime,
      required this.description,
      required this.coverImageUrl,
      required this.type,
      required this.totalDuration});
}

extension AudioMediaItemExtension on AudioMediaItem {
  VideoAudioPlayerTask toVideoAudioPlayerTask() {
    return VideoAudioPlayerTask(
      title: title,
      description: description,
      coverImageUrl: coverImageUrl,
      mediaUrl: mediaUrl,
      type: type,
      bvId: bvId,
      startTime: startTime,
      endTime: endTime,
      totalDuration: totalDuration,
    );
  }
}

extension AVideoAudioPlayerTaskExtension on VideoAudioPlayerTask {
  AudioMediaItem toAudioMediaItem() {
    return AudioMediaItem(
      title: title,
      description: description,
      coverImageUrl: coverImageUrl,
      mediaUrl: mediaUrl,
      type: type,
      bvId: bvId,
      startTime: startTime,
      endTime: endTime,
      totalDuration: totalDuration,
    );
  }
}

