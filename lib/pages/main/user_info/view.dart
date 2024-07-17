import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/router/b_v_t_page.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/weight/assemble_animated_opacity.dart';
import 'package:bili_video_tunes/common/weight/common_error.dart';
import 'package:bili_video_tunes/common/weight/player_history_card.dart';
import 'package:bili_video_tunes/common/weight/shimmer/user_page_shimmer.dart';
import 'package:bili_video_tunes/common/weight/song_sheet_card.dart';
import 'package:bili_video_tunes/pages/main/user_info/controller.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/controller/user_controller.dart';
import '../../../common/weight/qr_login_dialog/view.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final UserInfoPageController _controller =
      Get.put<UserInfoPageController>(UserInfoPageController());
  final AudioController _audioController = Get.find();
  final BiliAudioService _biliAudioService = Get.find();
  late Future<void> _initMyUserPageDataFuture;
  late Future<void> _initUserVideoFolder;
  final UserController _userController = Get.find();
  final _methodChannel = const MethodChannel('openAppChannel');

  @override
  void initState() {
    // 默认登录请求
    _initMyUserPageDataFuture = initMyUserPageData();
    // 设置全局事件总线监听
    listenGlobalValue();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void listenGlobalValue() {
    // 监听登录状态
    _userController.loginUserData.listen((value) async {
      setState(() {
        _initMyUserPageDataFuture = initMyUserPageData();
      });
    });
  }

  Future<void> initMyUserPageData() async {
    await _controller.initMeUserData();
    await _controller.initPlayerHistory();
    await _controller.initUserVideoFolder();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // 顶部栏
    AppBar appBar = AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, settingPath);
            },
            icon: const Icon(Icons.settings_rounded))
      ],
    );

    Widget userTopSliverToBoxAdapter = Obx(() => _controller.myUserData.value !=
            null
        ? SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controller.myUserData.value?.pendant?.image != null
                      ? SizedBox(
                          width: 140,
                          height: 140,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 30,
                                top: 30,
                                child: ClipOval(
                                  child: Image.network(
                                    _controller.myUserData.value!.face!,
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                              ),
                              _controller.myUserData.value!.pendant!.image!
                                  .let((it) {
                                if (it != "") {
                                  return CachedNetworkImage(imageUrl: it);
                                } else {
                                  return const SizedBox();
                                }
                              }),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.network(
                              _controller.myUserData.value!.pendant!.image!),
                        ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _controller.myUserData.value?.uname ?? "请先登录",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                "Lv${_controller.myUserData.value?.levelInfo?.currentLevel}",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${_controller.myUserData.value?.mid} | ",
                        style: const TextStyle(fontSize: 12),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://message.biliimg.com/bfs/im_new/8e9153fa9dfdfca8ebe97daea70075ef351201307.png",
                            width: 15,
                            height: 15,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          InkWell(
                              onTap: () async {
                                var map = {
                                  'name': '哔哩哔哩',
                                  'package': 'tv.danmaku.bili',
                                  'path':
                                      'bilibili://space/${_controller.myUserData.value?.mid}?from=bili_video_tunes'
                                };
                                await _methodChannel.invokeMethod(
                                    'openAppChannel', map);
                              },
                              child: const Text(
                                "B站首页",
                                style: TextStyle(fontSize: 12),
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        : const SliverToBoxAdapter(
            child: SizedBox(),
          ));

    Widget body = FutureBuilder<void>(
        future: _initMyUserPageDataFuture,
        builder: (BuildContext mContext, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 当Future还未完成时，显示加载中的UI
            return const UserPageShimmer();
          } else if (snapshot.hasError) {
            return CommonError(
                tip: "网络异常或数据错误",
                iconData: Icons.cloud_off_rounded,
                retryTip: "重试",
                retry: () {
                  setState(() {
                    _initMyUserPageDataFuture = initMyUserPageData();
                  });
                });
          } else {
            return _controller.myUserData.value != null
                ? AssembleAutoAnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    child: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [userTopSliverToBoxAdapter];
                      },
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.history_rounded,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("历史播放")
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("更多"),
                                          Icon(Icons.navigate_next_rounded),
                                        ],
                                      )),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 5,
                                  children: [
                                    for (var item
                                        in _controller.playerHistoryList)
                                      LayoutBuilder(
                                        builder: (context, box) {
                                          return SizedBox(
                                            width: 160,
                                            height: 165,
                                            child: PlayerHistoryCard(
                                              item: item,
                                              box: box,
                                              audioController: _audioController,
                                              biliAudioService:
                                                  _biliAudioService,
                                            ),
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.playlist_play_rounded,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("我的歌单")
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("更多"),
                                          Icon(Icons.navigate_next_rounded),
                                        ],
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: FilledButton.tonal(
                                        onPressed: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.add_outlined),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "新建我的歌单",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    child: FilledButton.tonal(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color?>(
                                                (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            // 当按钮被按下时的背景颜色
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.2);
                                          } else {
                                            // 默认状态下的背景颜色
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.1);
                                          }
                                        }),
                                      ),
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.edit_outlined),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "编辑我的歌单",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Wrap(
                                    spacing: 20,
                                    children: List.generate(
                                        _controller.favorites.length,
                                        (index) => InkWell(
                                              child: SongSheetCard(
                                                id: _controller
                                                        .favorites[index].id ??
                                                    0,
                                                title: _controller
                                                        .favorites[index]
                                                        .title ??
                                                    "",
                                                cover: _controller
                                                        .favorites[index]
                                                        .cover ??
                                                    "",
                                              ),
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, favPagePath,
                                                    arguments: {
                                                      "oid": _controller
                                                              .favorites[index]
                                                              .id
                                                              ?.toInt() ??
                                                          0
                                                    });
                                              },
                                            )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : CommonError(
                    tip: "未登录",
                    iconData: Icons.no_accounts_rounded,
                    retryTip: "登录",
                    retry: () async {
                      await showLoginDialog();
                      setState(() {
                        _initMyUserPageDataFuture = initMyUserPageData();
                      });
                    });
          }
        });

    return Scaffold(appBar: appBar, body: body);
  }

  Future<void> showLoginDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return const QrLoginDialog();
        });
  }

  @override
  bool get wantKeepAlive => true;
}
