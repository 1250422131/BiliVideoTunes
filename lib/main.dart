import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:bili_video_tunes/common/controller/user_controller.dart';
import 'package:bili_video_tunes/common/handler/bili_audio_handler.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';
import 'package:bili_video_tunes/common/utils/screen_utils.dart';
import 'package:bili_video_tunes/common/weight/music_player.dart';
import 'package:bili_video_tunes/common/weight/player_page.dart';
import 'package:bili_video_tunes/pages/main/bili_music/index.dart';
import 'package:bili_video_tunes/pages/main/user_info/index.dart';
import 'package:bili_video_tunes/pages/main/video_music/index.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:bili_video_tunes/services/service_locator.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:window_manager/window_manager.dart';

import 'common/controller/audio_controller.dart';
import 'common/di/database_model.dart';
import 'firebase_options.dart';

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
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  // 全局支持音乐播放器和对应控制器
  Get.put(UserController());
  Get.put<Isar>(await initDatabase());
  Get.put(BiliAudioService());

  if (GetPlatform.isMobile) {
    // 移动端服务
    Get.put<BiliAudioHandler>(await initAudioService());
  }

  Get.put(AudioController());

  if (!GetPlatform.isWindows && !GetPlatform.isLinux) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  static final _defaultDarkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, brightness: Brightness.dark);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        // navigatorObservers: [observer],
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
        ),
        home: MyHomePage(
          title: 'Flutter Demo Home Page',
          analytics: analytics,
          observer: observer,
        ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

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
  final PageController _pageController = PageController();

  late AudioController _audioController;

  late BiliAudioService _biliAudioService;

  late BiliAudioHandler _biliAudioHandler;

  late UserController _userController;

  late List<NavInfo> _navList;

  late List<NavigationDestination> navigationItem;

  late List<NavigationRailDestination> navRailItem;

  final PanelController _panelController = PanelController();

  double _panelPosition = 0;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _biliAudioService = Get.find<BiliAudioService>();
    _audioController = Get.find<AudioController>();
    _userController = Get.find<UserController>();
    _biliAudioHandler = Get.find<BiliAudioHandler>();

    initData();
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
  }

  Future<void> initData() async {
    // 初始化网络请求
    await initCookieJar();
    // 初始化用户信息
    await _userController.initLoginUserData();

    // 只在移动端生效
    if (GetPlatform.isMobile) {
      // 音乐服务 -> 主动规避耳机电话等
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.music());
      // Activate the audio session before playing audio.
      await session.setActive(true);
    }

    await _audioController.loadPlayerHistoryList();

    // 上报日志
    await widget.analytics.logAppOpen();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: !Platform.isAndroid && !Platform.isIOS && !kIsWeb
          ? buildMainAppBar()
          : null,
      body: PopScope(
        onPopInvoked: (bool didPop) {
          if (_panelController.isPanelOpen) {
            _panelController.close();
          }
        },
        canPop: _panelController.isAttached
            ? _panelController.isPanelClosed
            : false,
        child: Row(
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
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: getWindowsWidth(context) > ScreenSize.Normal
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: const [
                    VideoMusicPage(),
                    BiLiMusicPage(),
                    UserInfoPage()
                  ],
                ),
                Obx(() =>
                    _biliAudioService.playerIndex.value
                        ?.let((it) => SlidingUpPanel(
                              controller: _panelController,
                              onPanelSlide: (double position) {
                                setState(() {
                                  _panelPosition = position;
                                });
                              },
                              minHeight: 50,
                              collapsed: SizedBox(
                                  child: MusicPlayer(
                                panelController: _panelController,
                              )),
                              maxHeight: MediaQuery.of(context).size.height,
                              panel: Container(
                                height: MediaQuery.of(context).size.height,
                                color: Colors.white,
                                child: Opacity(
                                  opacity: _panelPosition,
                                  child: const PlayerPage(),
                                ),
                              ),
                            )) ??
                    const Column()),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: buildMainAppBottomNavigationBar(),
    );
  }


  Widget buildMainAppBottomNavigationBar(){
    return SizedBox(
      height: (0.80 * (1 - _panelPosition) * 100),
      child: Stack(
        children: [
          if (getWindowsWidth(this.context) <= ScreenSize.Normal)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 0),
              curve: Curves.easeInOut,
              bottom: -(0.80 * (_panelPosition) * 100),
              left: 0,
              right: 0,
              child: NavigationBar(
                destinations: navigationItem,
                selectedIndex: _currentPage,
                onDestinationSelected: (int index) {
                  setState(() {
                    _currentPage = index;
                    _pageController.jumpToPage(index);
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  PreferredSizeWidget buildMainAppBar(){

    final windowsButtonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );

    return AppBar(
      toolbarHeight: 32,
      actions: [
        IconButton(
          constraints:
          const BoxConstraints(maxHeight: 30, maxWidth: 30),
          padding: const EdgeInsets.all(6),
          style: windowsButtonStyle,
          iconSize: 15,
          icon: const Icon(Icons.horizontal_rule),
          onPressed: () {
            windowManager.minimize();
          },
        ),
        IconButton(
          constraints:
          const BoxConstraints(maxHeight: 30, maxWidth: 30),
          padding: const EdgeInsets.all(6),
          style: windowsButtonStyle,
          iconSize: 15,
          icon: const Icon(Icons.crop_square_rounded),
          onPressed: () {
            windowManager.maximize();
          },
        ),
        IconButton(
          constraints:
          const BoxConstraints(maxHeight: 30, maxWidth: 30),
          padding: const EdgeInsets.all(6),
          style: windowsButtonStyle,
          hoverColor: Colors.red,
          iconSize: 15,
          icon: const Icon(Icons.close),
          onPressed: () {
            windowManager.close();
          },
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  @override
  void dispose() {
    _biliAudioHandler.stop();
    super.dispose();
  }
}
