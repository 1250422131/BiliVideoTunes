import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/model/network/user/player_history_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/weight/video_music_card.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class PlayerHistoryCard extends StatefulWidget {
  final BoxConstraints box;

  final MList item;

  final AudioController audioController;

  final BiliAudioService biliAudioService;


  const PlayerHistoryCard({Key? key, required this.box, required this.item, required this.audioController, required this.biliAudioService}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerHistoryCardState();
}

class _PlayerHistoryCardState extends State<PlayerHistoryCard> {

  late BoxConstraints _box;

  late MList _item;

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
        child: Builder(builder: (BuildContext mContext) {
          return InkWell(
            onTap: () async {
              // 确定无重复的项目
              final audioMediaItem = AudioMediaItem(
                  title: _item.title ?? "",
                  description: _item.history?.part ?? "",
                  coverImageUrl: _item.cover ?? "",
                  type: AudioMediaType.video,
                  bvId: _item.history?.bvid);

              if (!_biliAudioService.playerList
                  .containsByToString(audioMediaItem)) {
                playerAddVideoAnimate(_item.cover ?? "", context, mContext);
                await _audioController.addPlayerAudio(audioMediaItem,autoPlay: _biliAudioService.playerList.isEmpty);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(child:  ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 80,
                            filterQuality: FilterQuality.none,
                            imageUrl: "${_item.cover}",
                            fit: BoxFit.cover, //设置图片的平铺模式
                            placeholder: (context, url) {
                              return Container(
                                color: Colors.grey.shade400,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    "assets/images/app/bili_load.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              );
                            },
                          ),
                        ))
                      ],
                    ),
                    Positioned(
                        right: 4,
                        bottom: 4,
                        child: Text(
                          "听到:${formatSeconds(_item.progress?.toInt() ?? 0)}",
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
                          _item.title ?? "解析错误",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Text(
                          _item.authorName ?? "解析错误",
                          style: TextStyle(
                              fontSize: 12, color: Theme.of(context).hintColor),
                        ),
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
