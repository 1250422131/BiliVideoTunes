import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/model/network/video_music/new_video_dynamic_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class VideoMusicCard extends StatefulWidget {
  final BoxConstraints box;

  final Archives item;

  final AudioController audioController;

  const VideoMusicCard({super.key, required this.box, required this.item, required this.audioController});

  @override
  State<StatefulWidget> createState() => _VideoMusicCardState(box, item,audioController);
}

class _VideoMusicCardState extends State<VideoMusicCard> {
  final BoxConstraints box;

  final Archives item;

  final AudioController audioController;

  _VideoMusicCardState(this.box, this.item, this.audioController);

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
                title: item.title ?? "",
                description: item.desc ?? "",
                coverImageUrl: item.pic ?? "",
                type: AudioMediaType.video,
                bvId: item.bvid,
                totalDuration: item.duration ?? 0);

            if (!audioController.playerList
                .containsByToString(audioMediaItem)) {
              await audioController.addPlayerAudio(audioMediaItem);
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
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          cacheWidth: (box.maxWidth *
                                  MediaQuery.of(context).devicePixelRatio)
                              .toInt(),
                          cacheHeight: (box.maxHeight *
                                  MediaQuery.of(context).devicePixelRatio)
                              .toInt(),
                          height: getWindowsWidth(context).let((it) {
                            if (it > ScreenSize.ExtraLarge) {
                              return 140;
                            } else if (it > ScreenSize.Large) {
                              return 120;
                            } else {
                              return 100;
                            }
                          }),
                          filterQuality: FilterQuality.none,
                          "${item.pic}",
                          fit: BoxFit.cover, //设置图片的平铺模式
                        ),
                      )),
                    ],
                  ),
                  Positioned(
                      right: 4,
                      bottom: 4,
                      child: Text(
                        formatSeconds(item.duration ?? 0),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 10,
                                  spreadRadius: 10)
                            ]),
                      ))
                ],
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
