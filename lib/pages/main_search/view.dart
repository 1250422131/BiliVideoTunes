import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/weight/assemble_animated_opacity.dart';
import 'package:bili_video_tunes/common/weight/common_error.dart';
import 'package:bili_video_tunes/common/weight/search/search_result_video_card.dart';
import 'package:bili_video_tunes/common/weight/search/search_text.dart';
import 'package:bili_video_tunes/common/weight/shimmer/search_squear_list_shimmer.dart';
import 'package:bili_video_tunes/common/weight/shimmer/video_card_grid_view_shimmer.dart';
import 'package:bili_video_tunes/pages/main_search/controller.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/utils/screen_utils.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({Key? key, this.defaultSearch}) : super(key: key);

  final String? defaultSearch;

  @override
  State<StatefulWidget> createState() => _MainSearch();
}

class _MainSearch extends State<MainSearch> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _textEditingController = TextEditingController();
  final MainSearchController _controller = Get.put(MainSearchController());
  final AudioController _audioController = Get.find();
  final BiliAudioService _biliAudioService = Get.find();

  late Future<void> _loadSearchSquareData;
  Future<void> _loadSearchResultData = Future.value();

  @override
  Widget build(BuildContext context) {
    // 分类TabBar
    TabBar classTabBar = TabBar(controller: _tabController, tabs: const [
      Tab(text: "综合"),
      Tab(text: "UP主"),
    ]);

    Widget searchOrderTabBar = Wrap(
      spacing: 10,
      children: [
        ChoiceChip(
          showCheckmark: false,
          label: const Text("综合排序"),
          selected: false,
          onSelected: (isSelected) {
            setState(() {});
          },
        ),
        ChoiceChip(
          showCheckmark: false,
          label: const Text("播放最多"),
          selected: false,
          onSelected: (isSelected) {
            setState(() {});
          },
        ),
        ChoiceChip(
          showCheckmark: false,
          label: const Text("最新发布"),
          selected: false,
          onSelected: (isSelected) {
            setState(() {});
          },
        ),
        ChoiceChip(
          showCheckmark: false,
          label: const Text("最多收藏"),
          selected: false,
          onSelected: (isSelected) {
            setState(() {});
          },
        ),
      ],
    );

    // 搜索结果
    Widget searchResult = Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: FutureBuilder(
          future: _loadSearchResultData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return CommonError(
                  tip: "网络异常或数据解析错误",
                  iconData: Icons.cloud_off_rounded,
                  retryTip: "重试",
                  retry: () {
                    setState(() {
                      _loadSearchResultData =
                          _controller.loadSearchByTypeResultInfo(
                              keyword: _textEditingController.value.text);
                    });
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const VideoCardGridViewShimmer();
            } else {
              return NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: searchOrderTabBar,
                      ),
                    ),
                  )
                ];
              }
              ,body: EasyRefresh(
                child: CustomScrollView(
                  slivers: [
                    Obx(() => SliverGrid.count(
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
                          return 1;
                        } else {
                          return 1;
                        }
                      }),
                      children: [
                        for (var item in _controller.searchResultList)
                          LayoutBuilder(
                            builder: (context, box) {
                              return SearchResultVideoCard(
                                item: item,
                                audioController: _audioController,
                                biliAudioService: _biliAudioService,
                                box: box,
                              );
                            },
                          ),
                      ],
                    ))
                  ],
                ),
                onLoad: () {
                  _loadSearchResultData =
                      _controller.loadSearchByTypeResultInfo(
                          keyword: _textEditingController.value.text,
                          page: _controller.searchResultInfo.value.data?.page
                              ?.let((it) => it + 1) ??
                              1);
                },
              ),);
            }
          }),
    );

    // 搜索框
    Widget searchBar = TextField(
      autofocus: true,
      controller: _textEditingController,
      textInputAction: TextInputAction.search,
      onChanged: (value) => {setState(() {})},
      decoration: InputDecoration(
        hintText: widget.defaultSearch,
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.clear,
            size: 22,
            color: Theme.of(context).colorScheme.outline,
          ),
          onPressed: () => setState(() {
            _textEditingController.clear();
          }),
        ),
      ),
      onSubmitted: (String value) {
        final keyword = _textEditingController.value.text.isEmpty
            ? widget.defaultSearch
            : _textEditingController.value.text;
        setState(() {
          _textEditingController.text = keyword ?? "";
          _loadSearchResultData = _controller.loadSearchByTypeResultInfo(
              keyword: keyword ?? "", isClear: true);
        });
      },
    );

    // 热搜列表
    Widget hostSearchList = FutureBuilder(
        future: _loadSearchSquareData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CommonError(
                tip: "网络异常或数据解析错误",
                iconData: Icons.cloud_off_rounded,
                retryTip: "重试",
                retry: () {
                  setState(() {
                    _loadSearchSquareData = _controller.loadSearchQueryInfo();
                  });
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const SearchSquareListShimmer();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "大家都在搜",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: 1,
                  ),
                  SliverGrid.builder(
                    itemCount: _controller.searchQueryInfo.value.data?.trending
                            ?.list?.length ??
                        0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // 设置每子元素的大小（宽高比）
                      childAspectRatio: 4 / 0.8,
                      // 元素的左右的 距离
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _controller.searchQueryInfo.value.data?.trending
                                  ?.list?[index].icon
                                  ?.let((it) => it != ""
                                      ? CachedNetworkImage(
                                          height: 15,
                                          imageUrl: it,
                                        )
                                      : null) ??
                              const SizedBox(),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            _controller.searchQueryInfo.value.data?.trending
                                    ?.list?[index].keyword ??
                                "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      );
                    },
                  ),
                  SliverList.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "搜索历史",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                    itemCount: 1,
                  ),
                  SliverToBoxAdapter(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      direction: Axis.horizontal,
                      textDirection: TextDirection.ltr,
                      children: List.generate(20, (index) {
                        return SearchText(
                          searchText: "搜索历史$index",
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
        });

    final Widget body =
        _textEditingController.text.isEmpty ? hostSearchList : searchResult;

    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.08),
            width: 1,
          ),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              final keyword = _textEditingController.text.isEmpty
                  ? widget.defaultSearch
                  : _textEditingController.text;
              setState(() {
                _textEditingController.text = keyword ?? "";
                _loadSearchResultData = _controller.loadSearchByTypeResultInfo(
                    keyword: keyword ?? "", isClear: true);
              });
            },
            icon: const Icon(Icons.search, size: 22),
          ),
          const SizedBox(width: 10)
        ],
        title: searchBar,
      ),
      body: body,
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _loadSearchSquareData = _controller.loadSearchQueryInfo();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.closeData();
    super.dispose();
  }
}
