import 'package:flutter/cupertino.dart';

import '../../../common/router/b_v_t_page.dart';
import '../../../common/utils/screen_utils.dart';
import '../user_info/view.dart';
import '../video_music/view.dart';

final PageController pageController = PageController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class NavInfo {
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  const NavInfo(
      {required this.title, required this.icon, required this.selectedIcon});
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
        },
        child: PageView(
          controller: pageController,
          // 添加页面滑动改变后，去改变索引变量刷新页面来更新底部导航
          onPageChanged: (int index) {},
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: getWindowsWidth(context) > ScreenSize.Normal
              ? Axis.vertical
              : Axis.horizontal,
          children: const [
            VideoMusicPage(),
            // BiLiMusicPage(),
            UserInfoPage()
          ],
        ));
  }
}
