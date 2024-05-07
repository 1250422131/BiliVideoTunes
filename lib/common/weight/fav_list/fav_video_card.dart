import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/model/network/user/fav_resource_list_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/weight/video_cover_image.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:flutter/material.dart';

import '../../api/res.dart';
import '../../utils/screen_utils.dart';
import '../badge.dart';

class FavVideoCard extends StatefulWidget {
  final Medias item;

  final AudioController audioController;

  final BiliAudioService biliAudioService;

  const FavVideoCard(
      {Key? key,
      required this.item,
      required this.audioController,
      required this.biliAudioService})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavVideoCardState();
}

class _FavVideoCardState extends State<FavVideoCard> {
  late Medias _item;

  late AudioController _audioController;

  late BiliAudioService _biliAudioService;

  @override
  void initState() {
    super.initState();
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
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias, //<--- 裁剪行为
        child: InkWell(
          onTap: () async {
            // 确定无重复的项目
            final audioMediaItem = AudioMediaItem(
                title: _item.title ?? "",
                description: _item.intro ?? "",
                coverImageUrl: "${_item.cover}",
                type: AudioMediaType.video,
                bvId: _item.bvid);

            if (!_biliAudioService.playerList
                .containsByToString(audioMediaItem)) {
              await _audioController.addPlayerAudio(audioMediaItem,autoPlay: _biliAudioService.playerList.isEmpty);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                  builder: (BuildContext context, constraints) {
                    return VideoCoverImage(
                      // cacheWidth: (_box.maxWidth *
                      //         MediaQuery.of(context).devicePixelRatio)
                      //     .toInt(),
                      // cacheHeight: (_box.maxHeight *
                      //         MediaQuery.of(context).devicePixelRatio)
                      //     .toInt(),
                      coverUrl: "${_item.cover}",

                      // height: imageHeight,
                    );
                  }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (_item.title ?? "解析错误"),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "收藏",
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
        ));
  }
}
