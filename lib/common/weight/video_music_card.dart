import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/model/network/video_music/new_video_dynamic_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/weight/video_cover_image.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/screen_utils.dart';
import 'badge.dart';

class VideoMusicCard extends StatefulWidget {
  final BoxConstraints box;

  final Archives item;

  final AudioController audioController;

  final BiliAudioService biliAudioService;

  const VideoMusicCard(
      {Key? key,
      required this.box,
      required this.item,
      required this.audioController,
      required this.biliAudioService})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoMusicCardState();
}

class _VideoMusicCardState extends State<VideoMusicCard> {
  late BoxConstraints _box;

  late Archives _item;

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
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias, //<--- 裁剪行为
        child: InkWell(
          onTap: () async {
            // 确定无重复的项目
            final audioMediaItem = AudioMediaItem(
                title: _item.title ?? "",
                description: _item.desc ?? "",
                coverImageUrl: _item.pic ?? "",
                type: AudioMediaType.video,
                bvId: _item.bvid,
                totalDuration: _item.duration ?? 0);

            if (!_biliAudioService.playerList
                .containsByToString(audioMediaItem)) {
              await _audioController.addPlayerAudio(audioMediaItem);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: LayoutBuilder(
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
                                  coverUrl: "${_item.pic}",
                                  height: imageHeight,
                                );
                              }),),
                    ],
                  ),
                  if ((_item.duration ?? 0) > 0)
                    PBadge(
                      bottom: 6,
                      right: 7,
                      size: 'small',
                      type: 'gray',
                      text:formatSeconds(_item.duration ?? 0),
                    )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics() ,
                    children: [
                      Text(
                        _item.title ?? "解析错误",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          if (_item.rcmdReason != '') ...[
                            PBadge(
                              text: _item.rcmdReason,
                              stack: 'normal',
                              size: 'small',
                              type: 'color',
                            )
                          ],
                          Expanded(
                            flex: 1,
                            child: Text(
                              _item.owner?.name ?? "解析错误",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize:
                                Theme.of(context).textTheme.labelMedium!.fontSize,
                                color: Theme.of(context).colorScheme.outline,
                              ),
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
