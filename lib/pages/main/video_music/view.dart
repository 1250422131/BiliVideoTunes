import 'package:bili_video_tunes/common/weight/hots_tag_shimmer.dart';
import 'package:bili_video_tunes/common/weight/video_card_grid_view_shimmer.dart';
import 'package:bili_video_tunes/common/weight/video_music_card.dart';
import 'package:bili_video_tunes/pages/main/video_music/index.dart';
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

  //不可变Future->防止UI多次刷新造成
  late Future<void> initVideoListFuture;
  late Future<void> initHostTagFuture;

  //界面标签
  int hotsTagSelectIndex = 0;
  int videoTabSelectIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: MaterialButton(
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
              GestureDetector(
                onTap: () {},
                child: ClipOval(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/28x28"),
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

              //更新Tag列表
              initHostTagFuture = controller.loadHotsTage(
                  rid: controller.tabItems.elementAt(index).rid, type: 0);

              //更新视频列表
              initVideoListFuture = controller.loadNewVideoDynamicInfo(
                  rid: controller.tabItems.elementAt(index).rid,
                  pn: 1,
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
                                          controller.hotsTags[index].tagName),
                                      selected: index == hotsTagSelectIndex,
                                      onSelected: (isSelected) {
                                        setState(() {
                                          final item =
                                              controller.hotsTags[index];
                                          if (isSelected) {
                                            hotsTagSelectIndex = index;
                                            initVideoListFuture = controller
                                                .loadNewVideoDynamicInfo(
                                                    rid: controller.tabItems
                                                        .elementAt(
                                                            videoTabSelectIndex)
                                                        .rid,
                                                    pn: 1,
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
          body: FutureBuilder<void>(
            future: initVideoListFuture,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 如果 future 尚未完成，显示加载指示器或其他占位符
                return const VideoCardGridViewShimmer();
              } else if (snapshot.hasError) {
                // 如果 future 发生错误，显示错误信息
                return Text('数据解析出错错误: ${snapshot.error}');
              } else {
                return Obx(() => GridView.count(
                    // 定义列数
                    crossAxisCount: 2,
                    // 定义列边距
                    crossAxisSpacing: 5,
                    // 定义行边距
                    mainAxisSpacing: 5,
                    // 定义内边距
                    childAspectRatio: 1.05,
                    // 设置宽高比为1:1，取消默认固定高度
                    padding: const EdgeInsets.all(5),
                    // 子元素
                    children: controller.videoMusicList
                        .map(
                          (item) => LayoutBuilder(
                            builder: (context, box) {
                              return VideoMusicCard(item: item, box: box);
                            },
                          ),
                        )
                        .toList()));
              }
            },
          )),
    );
  }

  @override
  void initState() {
    controller = Get.put(VideoMusicPageController());
    tabController = TabController(
        length: controller.tabItems.length, vsync: this, initialIndex: 0);

    //初始化

    //默认使用第一条
    initVideoListFuture = controller.loadNewVideoDynamicInfo(
        rid: controller.tabItems.elementAt(0).rid, pn: 1, ps: 14);

    initHostTagFuture = controller.initHotsTag();
    super.initState();
  }

  //状态保存
  @override
  bool get wantKeepAlive => true;
}
