import 'package:bili_video_tunes/pages/main/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_controller.dart';


class BVDNavigatorObserver extends NavigatorObserver {
  /// 内存泄漏
  final MainController _controller = Get.find<MainController>();

  @override
  void didPush(Route route, Route? previousRoute) {
    _controller.showBottomNav.value = route.settings.name == rootPagePath;
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute?.settings.name == rootPagePath) {
      _controller.showBottomNav.value = true;
    }
  }
}




const rootPagePath = "/";

const favPagePath = "/fav";
