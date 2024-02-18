import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/weight/common_error.dart';
import 'package:bili_video_tunes/common/weight/player_history_card.dart';
import 'package:bili_video_tunes/common/weight/shimmer/user_page_shimmer.dart';
import 'package:bili_video_tunes/pages/main/user_info/controller.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  void initState() {
    _initMyUserPageDataFuture = initMyUserPageData();
    initMyUserPageData();
    super.initState();
  }

  Future<void> initMyUserPageData() async {
    await _controller.initMeUserData();
    await _controller.initPlayerHistory();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Badge(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  textColor: Theme.of(context).colorScheme.onSecondaryContainer,
                  label: const Text('0'),
                  child: const Icon(Icons.info_outline_rounded),
                )),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.settings_rounded))
          ],
        ),
        body: FutureBuilder<void>(
            future: _initMyUserPageDataFuture,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
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
                    ? NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _controller.myUserData.value?.pendant
                                                ?.image !=
                                            null
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
                                                      _controller.myUserData
                                                          .value!.face!,
                                                      width: 80,
                                                      height: 80,
                                                    ),
                                                  ),
                                                ),
                                                Image.network(_controller
                                                    .myUserData
                                                    .value!
                                                    .pendant!
                                                    .image!),
                                              ],
                                            ),
                                          )
                                        : SizedBox(
                                            width: 120,
                                            height: 120,
                                            child: Image.network(_controller
                                                .myUserData
                                                .value!
                                                .pendant!
                                                .image!),
                                          ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _controller.myUserData.value?.uname ??
                                              "请先登录",
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: Container(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiaryContainer,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${_controller.myUserData.value?.mid} | ",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              "https://message.biliimg.com/bfs/im_new/8e9153fa9dfdfca8ebe97daea70075ef351201307.png",
                                              width: 15,
                                              height: 15,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            const Text(
                                              "B站首页",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ];
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
                                                audioController:
                                                    _audioController,
                                                biliAudioService:
                                                    _biliAudioService,
                                              ),
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : CommonError(
                        tip: "未登录",
                        iconData: Icons.cloud_off_rounded,
                        retryTip: "登录",
                        retry: () async{
                          await showLoginDialog();
                          setState(() {
                            _initMyUserPageDataFuture = initMyUserPageData();
                            _audioController.loadPlayerHistoryList();
                          });
                        });
              }
            }));
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