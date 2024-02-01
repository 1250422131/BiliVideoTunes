import 'dart:io';

import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/utils/screen_utils.dart';
import 'package:bili_video_tunes/common/weight/music_player.dart';
import 'package:bili_video_tunes/pages/main/bili_music/index.dart';
import 'package:bili_video_tunes/pages/main/user_info/index.dart';
import 'package:bili_video_tunes/pages/main/video_music/index.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'common/controller/audio_controller.dart';

void main() async {
  if (!Platform.isAndroid && !Platform.isIOS && !kIsWeb) {
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

  //状态栏、导航栏沉浸
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  static final _defaultDarkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class NavInfo {
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  const NavInfo(
      {required this.title, required this.icon, required this.selectedIcon});
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {

  // 控制器
  late PageController _pageController;

  late AudioController audioController;

  late List<NavInfo> _navList;

  late List<NavigationDestination> navigationItem;

  late List<NavigationRailDestination> navRailItem;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    audioController = Get.put(AudioController());

    _navList = [
      const NavInfo(
          title: "音频",
          icon: Icons.video_collection_outlined,
          selectedIcon: Icons.video_collection),
      const NavInfo(
          title: "音乐",
          icon: Icons.library_music_outlined,
          selectedIcon: Icons.library_music),
      const NavInfo(
          title: "我的",
          icon: Icons.account_box_outlined,
          selectedIcon: Icons.account_box)
    ];

    navigationItem = [
      for (var itemData in _navList)
        NavigationDestination(
          icon: Icon(itemData.icon),
          selectedIcon: Icon(itemData.selectedIcon),
          label: itemData.title,
          tooltip: itemData.title,
        ),
    ];

    navRailItem = [
      for (var itemData in _navList)
        NavigationRailDestination(
          icon: Icon(itemData.icon),
          selectedIcon: Icon(itemData.selectedIcon),
          label: Text(itemData.title),
        ),
    ];

    _pageController = PageController();

  } //当前页面

  @override
  Widget build(BuildContext context) {
    final windowsButtonStyle = ButtonStyle(

      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );

    return Scaffold(
      appBar:!Platform.isAndroid && !Platform.isIOS && !kIsWeb ? AppBar(
        toolbarHeight: 32,
        actions: [
          IconButton(
            constraints: const BoxConstraints(
                maxHeight: 30,
                maxWidth: 30
            ),
            padding: const EdgeInsets.all(6),
            style: windowsButtonStyle,
            iconSize: 15,
            icon: const Icon(Icons.horizontal_rule),
            onPressed: () {
              windowManager.minimize();
            },
          ),
          IconButton(
            constraints: const BoxConstraints(
                maxHeight: 30,
                maxWidth: 30
            ),
            padding: const EdgeInsets.all(6),
            style: windowsButtonStyle,
            iconSize: 15,
            icon: const Icon(Icons.crop_square_rounded),
            onPressed: () {
              windowManager.maximize();
            },
          ),
          IconButton(
            constraints: const BoxConstraints(
                maxHeight: 30,
                maxWidth: 30
            ),
            padding: const EdgeInsets.all(6),
            style: windowsButtonStyle,
            hoverColor: Colors.red,
            iconSize: 15,
            icon: const Icon(Icons.close),
            onPressed: () {
              windowManager.close();
            },
                ),
          const SizedBox(width: 5,)
        ],
      ) : null,
      body: Row(
        children: [
          Visibility(
            maintainState: true,
            visible: getWindowsWidth(context) > ScreenSize.Normal,
            child: NavigationRail(
              destinations: navRailItem,
              selectedIndex: _currentPage,
              onDestinationSelected: (int index) {
                _currentPage = index;
                _pageController.jumpToPage(index);
              },
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              PageView(
                controller: _pageController,
                // 添加页面滑动改变后，去改变索引变量刷新页面来更新底部导航
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                scrollDirection: getWindowsWidth(context) > ScreenSize.Normal
                    ? Axis.vertical
                    : Axis.horizontal,
                children: const [
                  VideoMusicPage(),
                  BiLiMusicPage(),
                  UserInfoPage()
                ],
              ),
              Obx(() => audioController.playerIndex.value?.let((it) => const MusicPlayer()) ?? const Column()),
            ],
          ))
        ],
      ),
      bottomNavigationBar: getWindowsWidth(this.context) <= ScreenSize.Normal
          ? NavigationBar(
        destinations: navigationItem,
        selectedIndex: _currentPage,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPage = index;
            _pageController.jumpToPage(index);
          });
        },
      )
          : null,
    );
  }


}
