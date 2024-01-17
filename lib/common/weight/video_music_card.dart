import 'package:bili_video_tunes/common/model/network/video_music/new_video_dynamic_info.dart';
import 'package:flutter/material.dart';

class VideoMusicCard extends StatefulWidget {
  final BoxConstraints box;

  final Archives item;

  const VideoMusicCard({super.key, required this.box, required this.item});

  @override
  State<StatefulWidget> createState() => _VideoMusicCardState(box, item);
}

class _VideoMusicCardState extends State<VideoMusicCard> {
  final BoxConstraints box;

  final Archives item;

  _VideoMusicCardState(this.box, this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias, //<--- 裁剪行为
        child: InkWell(
          onTap: (){},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cacheWidth:
                      (box.maxWidth * MediaQuery.of(context).devicePixelRatio)
                          .toInt(),
                  cacheHeight:
                      (box.maxHeight * MediaQuery.of(context).devicePixelRatio)
                          .toInt(),
                  width: box.maxWidth,
                  height: 100,
                  filterQuality: FilterQuality.none,
                  "${item.pic}",
                  fit: BoxFit.cover, //设置图片的平铺模式
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title ?? "解析错误",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        item.owner?.name ?? "解析错误",
                        style: TextStyle(
                            fontSize: 12, color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
