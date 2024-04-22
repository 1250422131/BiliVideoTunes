// 收藏视频卡片 - 水平布局
// 摘抄：https://github.com/guozhigq/pilipala/blob/main/lib/pages/fav_detail/widget/fav_video_card.dart
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../StyleString.dart';
import '../../model/network/user/fav_resource_list_info.dart';
import '../badge.dart';

class FavVideoCardH extends StatelessWidget {
  final Medias videoItem;
  final Function? callFn;
  final Function onClick;
  final int? searchType;

  const FavVideoCardH({
    Key? key,
    required this.videoItem,
    this.callFn,
    this.searchType,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onClick();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                StyleString.safeSpace, 5, StyleString.safeSpace, 5),
            child: LayoutBuilder(
              builder: (context, boxConstraints) {
                double width =
                    (boxConstraints.maxWidth - StyleString.cardSpace * 6) / 2;
                return SizedBox(
                  height: width / StyleString.aspectRatio,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: StyleString.aspectRatio,
                        child: LayoutBuilder(
                          builder: (context, boxConstraints) {
                            double maxWidth = boxConstraints.maxWidth;
                            double maxHeight = boxConstraints.maxHeight;
                            return Stack(
                              children: [
                                ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(StyleString.imgRadius.x),
                                  child: CachedNetworkImage(
                                    imageUrl: videoItem.cover ?? "",
                                    width: maxWidth,
                                    height: maxHeight,
                                    fit: BoxFit.cover,
                                  )
                                ),
                                PBadge(
                                  text: (videoItem.duration?.toInt() ?? 0).formatSeconds(),
                                  right: 6.0,
                                  bottom: 6.0,
                                  type: 'gray',
                                ),
                                if (videoItem.ogv != null) ...[
                                  PBadge(
                                    text: videoItem.ogv ?? "",
                                    top: 6.0,
                                    right: 6.0,
                                    bottom: null,
                                    left: null,
                                  ),
                                ],
                              ],
                            );
                          },
                        ),
                      ),
                      VideoContent(
                        videoItem: videoItem,
                        callFn: callFn,
                        searchType: searchType,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



}

class VideoContent extends StatelessWidget {
  final Medias videoItem;
  final Function? callFn;
  final int? searchType;
  const VideoContent({
    super.key,
    required this.videoItem,
    this.callFn,
    this.searchType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 6, 0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoItem.title ?? "标题",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (videoItem.ogv != null) ...[
                  Text(
                    videoItem.intro ?? "简介",
                    style: TextStyle(
                      fontSize:
                      Theme.of(context).textTheme.labelMedium!.fontSize,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  "收藏于",
                  style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.outline),
                ),
                if (videoItem.upper?.name != '') ...[
                  Text(
                    videoItem.upper!.name!,
                    style: TextStyle(
                      fontSize:
                      Theme.of(context).textTheme.labelMedium!.fontSize,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Row(
                    children: [
                      // StatView(
                      //   theme: 'gray',
                      //   view: videoItem.cntInfo['play'],
                      // ),
                      // const SizedBox(width: 8),
                      // StatDanMu(
                      //     theme: 'gray', danmu: videoItem.cntInfo['danmaku']),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
            // searchType != 1
            //     ? Positioned(
            //   right: 0,
            //   bottom: -4,
            //   child: IconButton(
            //     style: ButtonStyle(
            //       padding: MaterialStateProperty.all(EdgeInsets.zero),
            //     ),
            //     onPressed: () {
            //     },
            //     icon: Icon(
            //       Icons.clear_outlined,
            //       color: Theme.of(context).colorScheme.outline,
            //       size: 18,
            //     ),
            //   ),
            // )
            //     : const SizedBox(),
          ],
        ),
      ),
    );
  }
}