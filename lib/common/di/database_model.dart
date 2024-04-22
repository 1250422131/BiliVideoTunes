import 'package:bili_video_tunes/common/model/local/isar/setting.dart';
import 'package:bili_video_tunes/common/model/local/isar/video_audio_player_task.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<Isar> initDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [VideoAudioPlayerTaskSchema, SettingSchema],
    directory: dir.path,
  );
}
