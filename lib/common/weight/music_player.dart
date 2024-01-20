import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/audio_controller.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<StatefulWidget> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AudioController());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: Obx(() => Image.network(
                                  controller.playerIndex.value?.let((it) {
                                        return controller.playerList
                                            .elementAt(it)
                                            .coverImageUrl;
                                      }) ??
                                      "https://picx.zhimg.com/70/v2-53504944558fe60816f2633fd7543f72_1440w.png",
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Obx(() =>
                                Text(controller.playerIndex.value?.let((it) {
                                      return controller.playerList
                                          .elementAt(it)
                                          .title;
                                    }) ??
                                    "暂无播放")),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.pause),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => LinearProgressIndicator(
            value: controller.totalDuration.value != null
                ? (controller.currentPosition.value.inSeconds /
                    controller.totalDuration.value!.inSeconds)
                : 0,
          ),
        )
      ],
    );
  }
}
