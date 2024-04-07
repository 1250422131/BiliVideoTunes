import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/weight/assemble_animated_opacity.dart';
import 'package:bili_video_tunes/services/bili_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controller/audio_controller.dart';

class MusicPlayer extends StatefulWidget {
  final PanelController panelController;

  const MusicPlayer({Key? key, required this.panelController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioController controller;
  late PanelController _panelController;
  final BiliAudioService _biliAudioService = Get.find();

  @override
  void initState() {
    super.initState();
    controller = Get.find<AudioController>();
    _panelController = widget.panelController;
  }

  @override
  Widget build(BuildContext context) {
    return AssembleAutoAnimatedOpacity(duration: const Duration(milliseconds: 300),child: SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8, right: 8, ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                                child: Obx(() => Image.network(
                                  _biliAudioService.playerIndex.value
                                      ?.let((it) {
                                    return _biliAudioService
                                        .playerList[it].coverImageUrl;
                                  }) ??
                                      "https://picx.zhimg.com/70/v2-53504944558fe60816f2633fd7543f72_1440w.png",
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                )),
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Obx(() => Text(
                                      _biliAudioService.playerIndex.value
                                          ?.let((it) {
                                        return _biliAudioService.playerList
                                            .elementAt(it)
                                            .title;
                                      }) ??
                                          "暂无播放",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                    )),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Obx(() =>
                                _biliAudioService.playerState.value.playing
                                    ? IconButton(
                                    onPressed: () {
                                      controller.pause();
                                    },
                                    icon: const Icon(Icons.pause))
                                    : IconButton(
                                    onPressed: () {
                                      controller.play();
                                    },
                                    icon: const Icon(
                                        Icons.play_arrow_rounded))),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>  const PlayerPage(),
                          //   ),
                          // );
                          _panelController.open();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
                () => LinearProgressIndicator(
              value: _biliAudioService.totalDuration.value != null
                  ? (_biliAudioService.currentPosition.value.inSeconds /
                  _biliAudioService.totalDuration.value!.inSeconds)
                  : 0,
            ),
          )
        ],
      ),
    ),);
  }
}
