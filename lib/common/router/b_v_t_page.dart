import 'package:bili_video_tunes/pages/main/home/view.dart';
import 'package:bili_video_tunes/pages/user/fav_list/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_controller.dart';


class BVDNavigatorObserver extends NavigatorObserver {
  /// 内存泄漏
  final MainController _controller = Get.find<MainController>();

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint("看看合格${route.settings.name}");
    if (route.settings.name == rootPagePath) {
      _controller.panelPosition.value = 0;
      _controller.showBottomNav.value = true;
    } else {
      _controller.panelPosition.value = 1;
      _controller.showBottomNav.value = false;
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute?.settings.name == rootPagePath) {
      _controller.panelPosition.value = 0;
      _controller.showBottomNav.value = true;
    }
  }
}




const rootPagePath = "/";

const favPagePath = "/fav";
