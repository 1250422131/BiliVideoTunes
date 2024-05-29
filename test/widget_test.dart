// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/controller/user_controller.dart';
import 'package:bili_video_tunes/common/handler/bili_audio_handler.dart';
import 'package:bili_video_tunes/common/weight/shimmer/user_page_shimmer.dart';
import 'package:bili_video_tunes/common/weight/shimmer/video_card_grid_view_shimmer.dart';
import 'package:bili_video_tunes/main.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:bili_video_tunes/services/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // 全局支持音乐播放器和对应控制器
  //   Get.put(UserController());
  //   Get.put(BiliAudioService());
  //   Get.put<BiliAudioHandler>(await initAudioService());
  //   Get.put(AudioController());
  //
  //   await tester.pumpWidget(const UserPageShimmer());
  //   await Future.delayed(const Duration(seconds: 5));
  //
  //
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   await Future.delayed(const Duration(seconds: 5));
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  //
  // });
}
