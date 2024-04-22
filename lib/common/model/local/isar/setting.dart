import 'package:isar/isar.dart';

part 'generate/setting.g.dart';

@collection
class Setting {
  Id id = Isar.autoIncrement;

  bool autoCheckUpdate;

  ///显示搜索默认词
  bool showSearchDefaultWord;

  ///显示搜索历史
  bool showSearchHistory;

  Setting(
      {this.autoCheckUpdate = true,
      this.showSearchDefaultWord = true,
      this.showSearchHistory = true});
}
