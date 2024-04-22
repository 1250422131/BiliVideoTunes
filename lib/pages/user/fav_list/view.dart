import 'dart:async';

import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/weight/assemble_animated_opacity.dart';
import 'package:bili_video_tunes/common/weight/common_error.dart';
import 'package:bili_video_tunes/pages/user/fav_list/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/StyleString.dart';
import '../../../common/controller/audio_controller.dart';
import '../../../common/weight/fav_list/fav_video_card_h.dart';
import '../../../common/weight/shimmer/fav_list_card_shimmer.dart';
import '../../../services/bili_audio_service.dart';

class FavListPage extends StatefulWidget {
  final int oid;

  const FavListPage({Key? key, required this.oid}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavListPageState();
}

class _FavListPageState extends State<FavListPage> {
  int _page = 1;
  final int _pageSize = 20;
  final FavListController _controller = Get.put(FavListController());
  late Future<void> _loadFavDataFuture;
  final AudioController _audioController = Get.find<AudioController>();
  final BiliAudioService _biliAudioService = Get.find<BiliAudioService>();
  StreamController<bool> titleStreamC = StreamController<bool>(); // a
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadFavDataFuture = _controller.initFavList(mediaId: widget.oid);

    _scrollController.addListener(() {
      if (_scrollController.offset > 160) {
        titleStreamC.add(true);
      } else if (_scrollController.offset <= 160) {
        titleStreamC.add(false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildHeader() {
    return SliverAppBar(
        expandedHeight: 260 - MediaQuery.of(context).padding.top,
        pinned: true,
        titleSpacing: 0,
        flexibleSpace: buildFlexibleSpace(),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_circle_outline_rounded),
            onPressed: () async {
              for (var element in _controller.favList) {
                final item = AudioMediaItem(
                    title: element.title ?? "",
                    description: element.intro ?? "",
                    coverImageUrl: element.cover ?? "",
                    type: AudioMediaType.video,
                    bvId: element.bvid);
                await _audioController.addPlayerAudio(item,
                    autoPlay: false);
              }
            },
          ),
        ],
        title: StreamBuilder(
          stream: titleStreamC.stream,
          initialData: false,
          builder: (context, AsyncSnapshot snapshot) {
            return AnimatedOpacity(
              opacity: snapshot.data ? 1 : 0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _controller.favListInfo.value.data?.info?.title ??
                            "解析错误",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '共${_controller.favListInfo.value.data?.info?.mediaCount}条视频',
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ));
  }

  Widget buildFlexibleSpace() {
    return FlexibleSpaceBar(
        background: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.2),
          ),
        ),
      ),
      padding: EdgeInsets.only(
          top: kTextTabBarHeight + MediaQuery.of(context).padding.top + 30,
          left: 20,
          right: 20),
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(StyleString.imgRadius.x),
              child: _controller.favListInfo.value.data?.info?.cover != ""
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          _controller.favListInfo.value.data?.info?.cover ?? "",
                      width: 180,
                      height: 110,
                    )
                  : Container(
                      width: 180,
                      height: 110,
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: Center(
                        child: Text(
                            _controller.favListInfo.value.data?.info?.title ??
                                "解析错误"),
                      ),
                    ),
            ),
            const SizedBox(width: 14),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  _controller.favListInfo.value.data?.info?.title ?? "解析错误",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  _controller.favListInfo.value.data?.info?.upper?.name ??
                      "解析错误",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.labelSmall!.fontSize,
                      color: Theme.of(context).colorScheme.outline),
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }

  Widget buildVideoList() {
    return Obx(
      () => _controller.favList.isEmpty
          ? const SliverToBoxAdapter(child: SizedBox())
          : SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return FavVideoCardH(
                  videoItem: _controller.favList[index],
                  onClick: () {
                    final audioMediaItem = AudioMediaItem(
                        title: _controller.favList[index].title ?? "",
                        description: _controller.favList[index].intro ?? "",
                        coverImageUrl: _controller.favList[index].cover ?? "",
                        type: AudioMediaType.video,
                        bvId: _controller.favList[index].bvid);

                    if (!_biliAudioService.playerList
                        .containsByToString(audioMediaItem)) {
                      _audioController.addPlayerAudio(audioMediaItem);
                    }
                  },
                );
              }, childCount: _controller.favList.length),
            ),
    );
  }

  Widget buildBody() {
    return FutureBuilder(
      future: _loadFavDataFuture,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const FavListCardShimmer();
        } else if (snapshot.hasError) {
          return CommonError(
              tip: "网络错误或数据加载失败",
              iconData: Icons.wifi_tethering_error_rounded,
              retryTip: "重试",
              retry: () {
                setState(() {
                  _loadFavDataFuture =
                      _controller.initFavList(mediaId: widget.oid);
                });
              });
        } else {
          return AssembleAutoAnimatedOpacity(duration: const Duration(milliseconds: 300),child: EasyRefresh(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  buildHeader(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 15, bottom: 8, left: 14),
                      child: Obx(
                            () => Text(
                          '共${_controller.favListInfo.value.data?.info?.mediaCount}条视频 --- PiliPala',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .fontSize,
                              color: Theme.of(context).colorScheme.outline,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                  buildVideoList()
                ],
              ),
              onLoad: () async {
                _page++;
                await _controller.loadFavList(
                    mediaId: widget.oid, pn: _page, ps: _pageSize);
              }),);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }
}
