import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_controller.dart';
import '../../pages/main/home/view.dart';
import '../../pages/user/fav_list/view.dart';


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


Route onGenerateRoute(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case rootPagePath:
      page = const HomePage();
      break;
    case favPagePath:
      page = FavListPage(
        oid: (settings.arguments as Map<String, int>)["oid"]!,
      );
      break;
  }
  return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        return SafeArea(top: false,child: page,);
      });
}


const rootPagePath = "/";

const favPagePath = "/fav";
