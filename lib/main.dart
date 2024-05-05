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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  static final _defaultDarkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, brightness: Brightness.dark);

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  //
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return GetMaterialApp(
        title: 'BiliVideoTunes',
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
          // analytics: analytics,
          // observer: observer,
        ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    // required this.analytics,
    // required this.observer,
  }) : super(key: key);

  final String title;

  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

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

  final AudioController _audioController = Get.find<AudioController>();

  final BiliAudioService _biliAudioService = Get.find<BiliAudioService>();

  final BiliAudioHandler _biliAudioHandler = Get.find<BiliAudioHandler>();

  final UserController _userController = Get.find<UserController>();

  late List<NavInfo> _navList;

  late List<NavigationDestination> navigationItem;

  late List<NavigationRailDestination> navRailItem;

  final PanelController _panelController = PanelController();

  double _panelPosition = 1;

  int _currentPage = 0;

  final GlobalKey _bottomNavBarKey = GlobalKey();

// 在 initState 方法中，将一些初始化逻辑提取为单独的函数
  @override
  void initState() {
    super.initState();
    _initData();
    _initNavList();
    _initBottomNavBar();
  }

  Future<void> _initData() async {
    try {
      await initCookieJar();
      await _userController.initLoginUserData();
      if (GetPlatform.isMobile) {
        final session = await AudioSession.instance;
        await session.configure(const AudioSessionConfiguration.music());
        await session.setActive(true);
      }
      // 无论是否初始化成功，都要关闭加载中的UI
      await _audioController.loadPlayerHistoryList();
    } catch (e) {
      debugPrint('Error during initialization: $e');
    }
  }

  void _initNavList() {
    // 将 NavInfo 的实例化提取为常量
    const navInfoAudio = NavInfo(
        title: "音频",
        icon: Icons.video_collection_outlined,
        selectedIcon: Icons.video_collection);

    const navInfoMusic = NavInfo(
        title: "音乐",
        icon: Icons.library_music_outlined,
        selectedIcon: Icons.library_music);

    const navInfoMy = NavInfo(
        title: "我的",
        icon: Icons.account_box_outlined,
        selectedIcon: Icons.account_box);

    _navList = [navInfoAudio, navInfoMy];

    navigationItem = _navList
        .map((itemData) => NavigationDestination(
              icon: Icon(itemData.icon),
              selectedIcon: Icon(itemData.selectedIcon),
              label: itemData.title,
              tooltip: itemData.title,
            ))
        .toList();
    navRailItem = _navList
        .map((itemData) => NavigationRailDestination(
              icon: Icon(itemData.icon),
              selectedIcon: Icon(itemData.selectedIcon),
              label: Text(itemData.title),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !Platform.isAndroid && !Platform.isIOS && !kIsWeb
          ? buildMainAppBar() //
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
                    // BiLiMusicPage(),
                    UserInfoPage()
                  ],
                ),
                Obx(() => SlidingUpPanel(
                      controller: _panelController,
                      onPanelSlide: (double position) {
                        setState(() {
                          _panelPosition = position;
                        });
                      },
                      minHeight:
                          _biliAudioService.playerIndex.value != null ? 50 : 0,
                      collapsed: _biliAudioService.playerIndex.value
                          ?.let((it) => MusicPlayer(
                                panelController: _panelController,
                              )),
                      maxHeight: MediaQuery.of(context).size.height,
                      panel: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Opacity(
                          opacity: _panelPosition,
                          child: PlayerPage(
                            panelController: _panelController,
                          ),
                        ),
                      ),
                    )),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: buildMainAppBottomNavigationBar(),
    );
  }

  Widget buildMainAppBottomNavigationBar() {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        // _panelPosition 是底部对话框的高度变化
        height: (_bottomNavBarKey.currentContext
                    ?.findRenderObject()
                    ?.let((it) => (it as RenderBox).size.height) ??
                0) *
            (1 - _panelPosition),
        child: Stack(
          children: [
            if (getWindowsWidth(context) <= ScreenSize.Normal)
              // AnimatedPositioned 当底部对话框出现时，NavigationBar需要缓慢下降
              AnimatedPositioned(
                duration: const Duration(milliseconds: 0),
                curve: Curves.easeInOut,
                bottom: -((_bottomNavBarKey.currentContext
                            ?.findRenderObject()
                              ?.let((it) => (it as RenderBox).size.height) ??
                        0) *
                    (_panelPosition)),
                left: 0,
                right: 0,
                child: NavigationBar(
                  key: _bottomNavBarKey,
                  destinations: navigationItem,
                  selectedIndex: _currentPage,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentPage = index;
                      _pageController.jumpToPage(index);
                    });
                  },
                ),
              )
          ],
        ),
      );
    });
  }

  // 这个Appbar是给桌面平台准备的，目前还没有实现完整
  PreferredSizeWidget buildMainAppBar() {
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
          constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
          padding: const EdgeInsets.all(6),
          style: windowsButtonStyle,
          iconSize: 15,
          icon: const Icon(Icons.horizontal_rule),
          onPressed: () {
            windowManager.minimize();
          },
        ),
        IconButton(
          constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
          padding: const EdgeInsets.all(6),
          style: windowsButtonStyle,
          iconSize: 15,
          icon: const Icon(Icons.crop_square_rounded),
          onPressed: () {
            windowManager.maximize();
          },
        ),
        IconButton(
          constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
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


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initBottomNavBar();
  }

  Future<void> _initBottomNavBar() async{
    Future.delayed(const Duration(milliseconds: 1000),(){
      setState(() {
        _panelPosition = 0;
      });
    });
  }
}
