import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/utils/screen_utils.dart';
import 'package:bili_video_tunes/common/weight/hots_tag_shimmer.dart';
import 'package:bili_video_tunes/common/weight/qr_login_dialog/index.dart';
import 'package:bili_video_tunes/common/weight/video_card_grid_view_shimmer.dart';
import 'package:bili_video_tunes/common/weight/video_music_card.dart';
import 'package:bili_video_tunes/pages/main/video_music/index.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoMusicPage extends StatefulWidget {
  const VideoMusicPage({super.key});

  @override
  State<VideoMusicPage> createState() => _VideoMusicPageState();
}

class _VideoMusicPageState extends State<VideoMusicPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  //
  late VideoMusicPageController controller;
  late TabController tabController;
  late AudioController audioController;

  //不可变Future->防止UI多次刷新造成
  late Future<void> initVideoListFuture;
  late Future<void> initHostTagFuture;

  //界面标签
  int hotsTagSelectIndex = 0;
  int videoTabSelectIndex = 0;
  int videoPageNum = 1;


  Future<void> showLoginDialog()async {
    return showDialog(context: context, builder: (context){
      return const QrLoginDialog();
    });
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: MaterialButton(
          onPressed: () async{
            await showLoginDialog();
          },
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
              GestureDetector(
                onTap: () {},
                child: ClipOval(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image:
                        NetworkImage("https://i0.hdslb.com/bfs/face/member/noface.jpg@240w_240h"),
                        fit: BoxFit.contain,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: controller.tabItems.map((e) => Tab(text: e.name)).toList(),
          controller: tabController,
          onTap: (int index) {
            setState(() {
              //更新当前选中项
              videoTabSelectIndex = index;
              hotsTagSelectIndex = 0;
              videoPageNum = 0;

              //更新Tag列表
              initHostTagFuture = controller.loadHotsTage(
                  rid: controller.tabItems.elementAt(index).rid, type: 0);

              //更新视频列表
              initVideoListFuture = controller.loadNewVideoDynamicInfo(
                  rid: controller.tabItems.elementAt(index).rid,
                  pn: videoPageNum,
                  ps: 30,
                  isClear: true);
            });
          },
        ),
      ),
      body: NestedScrollView(
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
                      future: initHostTagFuture,
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // 当Future还未完成时，显示加载中的UI
                          return const HotsTagShimmerWrap(
                              mockNum: 5, spacing: 10);
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // 当Future成功完成时，显示数据
                          return Obx(() => Wrap(
                            spacing: 10,
                            children: [
                              for (var index = 0;
                              index < controller.hotsTags.length;
                              index++)
                                ChoiceChip(
                                  label: Text(
                                          controller.hotsTags[index].tagName ??
                                              ""),
                                      selected: index == hotsTagSelectIndex,
                                      onSelected: (isSelected) {
                                        setState(() {
                                          final item =
                                              controller.hotsTags[index];

                                          if (isSelected) {
                                            hotsTagSelectIndex = index;
                                            videoPageNum = 0;
                                            initVideoListFuture = controller
                                                .loadNewVideoDynamicInfo(
                                                    rid: controller.tabItems
                                                        .elementAt(
                                                            videoTabSelectIndex)
                                                        .rid,
                                                    pn: videoPageNum,
                                                    ps: 30,
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
          body: Obx(() => controller.videoMusicList.isNotEmpty ? EasyRefresh(
              onLoad: () async {
                setState(() {
                  controller.loadNewVideoDynamicInfo(
                      rid: controller.tabItems
                          .elementAt(videoTabSelectIndex)
                          .rid,
                      tagId: controller.hotsTags
                          .elementAt(hotsTagSelectIndex)
                          .tagId,
                      pn: ++videoPageNum,
                      ps: 30);
                });
                return controller.videoMusicPageInfo.value.let((it) {
                  if (videoPageNum < (it.count / it.size * 1.0).ceil()) {
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
                    childAspectRatio: getWindowsWidth(context).let((it) {
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
                      for (var item in controller.videoMusicList)
                        LayoutBuilder(
                          builder: (context, box) {
                            //传递audioController是由于不希望Getx在每次循环都去Find
                            return VideoMusicCard(
                                item: item,
                                box: box,
                                audioController: audioController);
                          },
                        ),
                    ],
                  ),
                  SliverFixedExtentList(
                    itemExtent:
                    audioController.playerIndex.value != null ? 70 : 0,
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        //创建列表项
                        return Container();
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              )) : const VideoCardGridViewShimmer())),
    );
  }

  @override
  void initState() {
    controller = Get.put(VideoMusicPageController());
    audioController = Get.find<AudioController>();

    tabController = TabController(
        length: controller.tabItems.length, vsync: this, initialIndex: 0);

    //初始化

    //默认使用第一条
    initVideoListFuture = controller.loadNewVideoDynamicInfo(
        rid: controller.tabItems.elementAt(0).rid, pn: videoPageNum, ps: 30);

    initHostTagFuture = controller.initHotsTag();
    super.initState();
  }

  //状态保存
  @override
  bool get wantKeepAlive => true;
}
