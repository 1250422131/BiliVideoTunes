import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/controller/user_controller.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/utils/screen_utils.dart';
import 'package:bili_video_tunes/common/weight/common_error.dart';
import 'package:bili_video_tunes/common/weight/hots_tag_shimmer.dart';
import 'package:bili_video_tunes/common/weight/qr_login_dialog/index.dart';
import 'package:bili_video_tunes/common/weight/shimmer/video_card_grid_view_shimmer.dart';
import 'package:bili_video_tunes/common/weight/video_music_card.dart';
import 'package:bili_video_tunes/pages/main/video_music/index.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//音频页面
class VideoMusicPage extends StatefulWidget {
  const VideoMusicPage({super.key});

  @override
  State<VideoMusicPage> createState() => _VideoMusicPageState();
}

class _VideoMusicPageState extends State<VideoMusicPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  //声明
  late VideoMusicPageController _controller;
  late TabController _tabController;
  late AudioController _audioController;
  late UserController _userController;
  final BiliAudioService _biliAudioService = Get.find();

  late ScrollController _tabScrollController;

  //不可变Future->防止UI多次刷新造成卡顿
  late Future<void> _initVideoListFuture;
  late Future<void> _initHostTagFuture;

  //界面标签
  int hotsTagSelectIndex = 0;
  int videoTabSelectIndex = 0;
  int videoPageNum = 1;

  //显示登录弹窗
  Future<void> showLoginDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return const QrLoginDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double screenW = MediaQuery.of(context).size.width;

    /******************************
     * 音频页面的顶部搜索组件
     ******************************/
    Widget searchWidget = MaterialButton(
      onPressed: () {},
      color: Theme.of(context).colorScheme.surfaceVariant,
      height: 50,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Icon(
              (Icons.search),
              size: 24,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Text("",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge)),
          const SizedBox(
            width: 16,
          ),
          Obx(() => InkWell(
            child: GestureDetector(
              onTap: () {
                if (_userController.loginUserData.value == null) {
                  showLoginDialog();
                }
              },
              child: ClipOval(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_userController
                          .loginUserData.value?.face ??
                          "https://i0.hdslb.com/bfs/face/member/noface.jpg@240w_240h"),
                      fit: BoxFit.contain,
                    ),
                    shape: const OvalBorder(),
                  ),
                ),
              ),
            ),
            onTap: () {
              if (_userController.loginUserData.value == null) {
                showLoginDialog();
              }
            },
          )),
        ],
      ),
    );

    /******************************
     * 用于切换标签
     ******************************/
    Widget tagBar = TabBar(
      tabs: _controller.tabItems.map((e) => Tab(text: e.name)).toList(),
      controller: _tabController,
      onTap: (int index) {
        setState(() {
          // 更新当前选中项
          videoTabSelectIndex = index;
          hotsTagSelectIndex = 0;
          videoPageNum = 1;

          // 更新 Tag 列表
          _initHostTagFuture = _controller.loadHotsTage(
            rid: _controller.tabItems[index].rid,
            type: 0,
          );

          // 更新视频列表
          _initVideoListFuture = _controller.loadNewVideoDynamicInfo(
            rid: _controller.tabItems[index].rid,
            pn: videoPageNum,
            ps: 14,
            isClear: true,
          );
        });
      },
    );

    tagBar = Container(
      height: screenW*0.12,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
          Container(
            width: screenW*1.2,
            child: tagBar,
          )
      ),
    );

    /******************************
     * 卡片列表视图
     ******************************/
    var videoCardList = Obx(() => EasyRefresh(
        onLoad: () async {
          await _controller.loadNewVideoDynamicInfo(
              rid: _controller.tabItems
                  .elementAt(videoTabSelectIndex)
                  .rid,
              tagId: _controller.hotsTags
                  .elementAt(hotsTagSelectIndex)
                  .tagId,
              pn: ++videoPageNum,
              ps: 14);
          return _controller.videoMusicPageInfo.value.let((it) {
            if (videoPageNum <
                (it.count / it.size * 1.0).ceil()) {
              return IndicatorResult.success;
            } else {
              IndicatorResult.noMore;
            }
          });
        },
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              crossAxisCount: getWindowsWidth(context).let((it) {
                if (it > ScreenSize.ExtraLarge) {
                  return 5;
                } else if (it > ScreenSize.Large) {
                  return 4;
                } else if (it > ScreenSize.Normal) {
                  return 3;
                } else if (it > ScreenSize.Small) {
                  return 2;
                } else {
                  return 1;
                }
              }),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio:
              getWindowsWidth(context).let((it) {
                if (it > ScreenSize.ExtraLarge) {
                  return 1.3;
                } else if (it > ScreenSize.Large) {
                  return 1.2;
                } else if (it > ScreenSize.Normal) {
                  return 1.1;
                } else {
                  return 1.05;
                }
              }),
              children: [
                for (var item in _controller.videoMusicList)
                  LayoutBuilder(
                    builder: (context, box) {
                      //传递audioController是由于不希望Getx在每次循环都去Find
                      return VideoMusicCard(
                        item: item,
                        box: box,
                        audioController: _audioController,
                        biliAudioService: _biliAudioService,
                      );
                    },
                  ),
              ],
            ),
            SliverFixedExtentList(
              itemExtent:
              _biliAudioService.playerIndex.value != null
                  ? 70
                  : 0,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return Container();
                },
                childCount: 1,
              ),
            ),
          ],
        )
      )
    );

    /******************************
     * 主体
     ******************************/
    Widget body = NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10),
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<void>(
                  future: _initHostTagFuture,
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // 当Future还未完成时，显示加载中的UI
                      return const HotsTagShimmerWrap(
                          mockNum: 5, spacing: 10);
                    } else if (snapshot.hasError) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Theme.of(context).colorScheme.errorContainer,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 16, right: 8),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.signal_wifi_bad_outlined,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onErrorContainer,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text("网络异常或加载失败")
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _initHostTagFuture =
                                          _controller.initHotsTag();
                                    });
                                  },
                                  child: Text(
                                    "重试",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onErrorContainer),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      // 当Future成功完成时，显示数据
                      return Obx(() => Wrap(
                        spacing: 10,
                        children: [
                          for (var index = 0;
                          index < _controller.hotsTags.length;
                          index++)
                            ChoiceChip(
                              label: Text(
                                  _controller.hotsTags[index].tagName ??
                                      ""),
                              selected: index == hotsTagSelectIndex,
                              onSelected: (isSelected) {
                                setState(() {
                                  final item =
                                  _controller.hotsTags[index];

                                  if (isSelected) {
                                    hotsTagSelectIndex = index;
                                    videoPageNum = 1;
                                    _initVideoListFuture = _controller
                                        .loadNewVideoDynamicInfo(
                                        rid: _controller.tabItems
                                            .elementAt(
                                            videoTabSelectIndex)
                                            .rid,
                                        pn: videoPageNum,
                                        ps: 14,
                                        tagId: item.tagId,
                                        isClear: true);
                                  }
                                });
                              },
                            ),
                        ],
                      ));
                    }
                  },
                ),
              ),
            ),
          ),
        ];
      },
      body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: FutureBuilder<void>(
            future: _initVideoListFuture,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const VideoCardGridViewShimmer();
              } else if (snapshot.hasError) {
                return CommonError(
                    tip: "网络异常或数据异常",
                    iconData: Icons.cloud_off_rounded,
                    retryTip: "重试",
                    retry: () {
                      setState(() {
                        _initVideoListFuture =
                            _controller.loadNewVideoDynamicInfo(
                                rid: _controller.tabItems.elementAt(0).rid,
                                pn: videoPageNum,
                                ps: 14,
                                isClear: true);
                      });
                    });
              } else {
                // 当Future成功完成时，显示卡片
                return videoCardList;
              }
            },
          )
      ),
    );


    body = Column(
      children: [
        tagBar,
        Expanded(child: body),
      ],
    );

    /******************************
     * 主页面
     ******************************/
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title:searchWidget,
        centerTitle: true,
      ),
      body: body,
    );
  }


  @override
  void initState() {
    _controller = Get.put(VideoMusicPageController());
    _audioController = Get.find<AudioController>();
    _userController = Get.find<UserController>();
    _tabController = TabController(
        length: _controller.tabItems.length, vsync: this, initialIndex: 0);

    //默认使用第一条
    _initVideoListFuture = _controller.initNewVideoList();

    _initHostTagFuture = _controller.initHotsTag();

    _tabScrollController = ScrollController();
    super.initState();
  }

  //状态保存
  @override
  bool get wantKeepAlive => true;
}
