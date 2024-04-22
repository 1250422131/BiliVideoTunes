import 'package:bili_video_tunes/common/model/local/isar/setting.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

class SettingStorage {
   IsarCollection<Setting> setting = Get.find<Isar>().settings;
}
