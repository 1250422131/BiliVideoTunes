import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/model/network/home/search_by_type_result_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/utils/screen_utils.dart';
import 'package:bili_video_tunes/common/weight/badge.dart';
import 'package:bili_video_tunes/common/weight/video_cover_image.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:flutter/material.dart';

import '../../StyleString.dart';
import '../video_music_card.dart';

class SearchResultVideoCard extends StatefulWidget {
  final BoxConstraints box;

  final Result item;

  final AudioController audioController;

  final BiliAudioService biliAudioService;

  const SearchResultVideoCard(
      {Key? key,
      required this.box,
      required this.item,
      required this.audioController,
      required this.biliAudioService})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchResultVideoCardState();
}

class _SearchResultVideoCardState extends State<SearchResultVideoCard> {
  late BoxConstraints _box;

  late Result _item;

  late AudioController _audioController;

  late BiliAudioService _biliAudioService;

  @override
  void initState() {
    super.initState();
    _box = widget.box;
    _item = widget.item;
    _audioController = widget.audioController;
    _biliAudioService = widget.biliAudioService;
  }

  String formatSeconds(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hoursStr:$minutesStr:$secondsStr';
    } else {
      return '$minutesStr:$secondsStr';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(StyleString.imgRadius.x),
        ),
        clipBehavior: Clip.antiAlias, //<--- 裁剪行为
        child: Builder(builder: (BuildContext mContext) {
          return InkWell(
            onTap: () async {
              // 确定无重复的项目
              final audioMediaItem = AudioMediaItem(
                  title: _item.title
                      ?.replaceAll('<em class="keyword">', "")
                      .replaceAll("</em>", "") ??
                      "",
                  description: _item.desc ?? "",
                  coverImageUrl: "http:${_item.pic}" ?? "",
                  type: AudioMediaType.video,
                  bvId: _item.bvid);

              if (!_biliAudioService.playerList
                  .containsByToString(audioMediaItem)) {
                playerAddVideoAnimate(_item.cover ?? "", context, mContext);
                await _audioController.addPlayerAudio(audioMediaItem,autoPlay: _biliAudioService.playerList.isEmpty);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(StyleString.imgRadius.x),
                              clipBehavior: Clip.antiAlias,

                              child:  LayoutBuilder(
                                  builder: (BuildContext context, constraints) {
                                    final imageHeight =
                                    getWindowsWidth(context).let((it) {
                                      if (it > ScreenSize.ExtraLarge) {
                                        return 140;
                                      } else if (it > ScreenSize.Large) {
                                        return 120;
                                      } else {
                                        return 100;
                                      }
                                    }).toDouble();
                                    return VideoCoverImage(
                                      // cacheWidth: (_box.maxWidth *
                                      //         MediaQuery.of(context).devicePixelRatio)
                                      //     .toInt(),
                                      // cacheHeight: (_box.maxHeight *
                                      //         MediaQuery.of(context).devicePixelRatio)
                                      //     .toInt(),
                                      coverUrl: "http:${_item.pic}",
                                      // height: imageHeight,
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      PBadge(
                        bottom: 6,
                        right: 7,
                        size: 'small',
                        type: 'gray',
                        text: _item.duration,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (_item.title ?? "解析错误")
                              .replaceAll('<em class="keyword">', "")
                              .replaceAll("</em>", ""),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              _item.author ?? "解析错误",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .fontSize,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },));
  }
}
