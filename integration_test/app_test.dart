import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/controller/user_controller.dart';
import 'package:bili_video_tunes/common/di/database_model.dart';
import 'package:bili_video_tunes/common/handler/bili_audio_handler.dart';
import 'package:bili_video_tunes/common/weight/shimmer/user_page_shimmer.dart';
import 'package:bili_video_tunes/common/weight/shimmer/video_card_grid_view_shimmer.dart';
import 'package:bili_video_tunes/firebase_options.dart';
import 'package:bili_video_tunes/main.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:bili_video_tunes/services/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    if (!GetPlatform.isMobile && !kIsWeb) {
      WidgetsFlutterBinding.ensureInitialized();
      // 必须加上这一行。
      await windowManager.ensureInitialized();

      WindowOptions windowOptions = const WindowOptions(
        size: Size(800, 600),
        center: true,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.hidden,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    }

    // 用户信息
    Get.put(UserController());
    // Isar数据库
    Get.put<Isar>(await initDatabase());
    // BiliAudioService 记录了目前播放器的进度，播放曲目等信息
    Get.put(BiliAudioService());
    // BiliAudioHandler封装了对Just_Audio的操作
    Get.put<BiliAudioHandler>(await initAudioService());
    // AudioController是对BiliAudioHandler的封装
    Get.put(AudioController());

    if (!GetPlatform.isDesktop) {
      // 这个是谷歌的数据分析，目前不支持桌面
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      //状态栏、导航栏沉浸
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ));
    }


    await tester.pumpWidget(const MyApp());

  });
}
