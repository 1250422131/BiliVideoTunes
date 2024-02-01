import 'dart:async';

import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'colorful_text_widget.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<StatefulWidget> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage>
    with SingleTickerProviderStateMixin {
  late AudioController audioController;
  late ScrollController scrollController;
  late ThemeData myCustomTheme;
  late AnimationController playIconAnimationController;

  bool shouldDisableBouncing = false;

  // 存储监听器的变量
  late StreamSubscription<Duration> positionListener;

  @override
  void initState() {
    super.initState();

    audioController = Get.find<AudioController>();
    scrollController = ScrollController();

    playIconAnimationController = AnimationController(vsync: this)
      ..drive(Tween(begin: 0, end: 1))
      ..duration = const Duration(milliseconds: 500);

    if (!audioController.playerState.value.playing) {
      playIconAnimationController.forward();
    }
  }

  @override
  void dispose() {
    // 取消监听器
    super.dispose();
  }

  void scrollToCurrentLine() {
    bool isAtBottom = scrollController.position.pixels >=
        scrollController.position.maxScrollExtent;

    bool isAtTop = scrollController.position.pixels <=
        scrollController.position.minScrollExtent;

    if (audioController.lyricLineIndex.value > 3 &&
        (!isAtBottom) &&
        scrollController.hasClients) {
      late double lineHeight = 70;

      final double offset =
          (audioController.lyricLineIndex.value - 3) * lineHeight;

      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void updateCurrentLine(int currentTime) {
    audioController.playerIndex.value?.also((it) {
      final audioItem = audioController.playerList[it];
      final lyricLength = audioItem.lyricList?.length ?? 0;

      // 这里已经判断了 lyricList 绝对的存在
      for (int i = 0; i < lyricLength; i++) {
        if (i < lyricLength - 1) {
          if (currentTime >= audioItem.lyricList!.elementAt(i).starTime &&
              currentTime < audioItem.lyricList!.elementAt(i + 1).starTime) {
            setState(() {
              audioController.lyricLineIndex.value = i;
            });
            scrollToCurrentLine();
            break;
          }
        } else {
          setState(() {
            audioController.lyricLineIndex.value = i;
          });
          scrollToCurrentLine();
        }
      }
    });
  }

  // 等待单独抽离
  Future<void> _showModalBottomSheet() {
    return showModalBottomSheet(
        context: context,
        shape: const Border(),
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext buildContext) {
          return Theme(
              data: myCustomTheme,
              child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: const Size(double.infinity, 56),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AppBar(
                        centerTitle: true, // 标题居中
                        title: const Text(
                          "播放列表",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
                body: Obx(() => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ReorderableListView(
                          onReorder: (int oldIndex, int newIndex) {
                            setState(()  {

                              if (oldIndex < newIndex) {
                                newIndex -= 1;
                              }
                              final  item = audioController.playerList.removeAt(oldIndex);
                              audioController.playerList.insert(newIndex, item);
                              if(oldIndex == audioController.playerIndex.value){
                                audioController.playerIndex.value = newIndex;
                              }

                            });
                          },
                          children: List.generate(
                              audioController.playerList.length,
                              (index) => InkWell(
                                    key: Key('$index'),
                                    child: Container(
                                      color: myCustomTheme.primaryColor
                                          .withOpacity(index ==
                                                  (audioController
                                                          .playerIndex.value ??
                                                      0)
                                              ? 0.2
                                              : 0.05),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              child: Image.network(
                                                audioController
                                                    .playerList[index]
                                                    .coverImageUrl,
                                                width: 35,
                                                height: 35,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Obx(() => Text(
                                                      audioController
                                                          .playerList[index]
                                                          .title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                    )),
                                                Obx(() => Row(
                                                      children: [
                                                        Text(
                                                          audioController
                                                                  .playerList[
                                                                      index]
                                                                  .bvId ??
                                                              "",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 11),
                                                          softWrap: false,
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 5,
                                                                  right: 5),
                                                          child: Text(
                                                            "·",
                                                            style: TextStyle(
                                                                fontSize: 11),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Text(
                                                          audioController
                                                              .playerList[index]
                                                              .totalDuration
                                                              .formatSeconds(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 11),
                                                          softWrap: false,
                                                          textAlign:
                                                              TextAlign.start,
                                                        ))
                                                      ],
                                                    )),
                                              ],
                                            )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {},
                                  ))),
                    )),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕中心位置
    final screenHeightHalf = MediaQuery.of(context).size.height / 2;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Obx(() => Theme(
        data: ThemeData.from(
          colorScheme: isDarkMode
              ? audioController.audioDarkColorScheme.value
              : audioController.audioLightColorScheme.value,
        ).let((it) {
          myCustomTheme = it;
          return it;
        }).copyWith(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent,
              statusBarColor: Colors.transparent,
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: audioController.playerIndex.value?.let((it) {
                  return Text(audioController.playerList.elementAt(it).title);
                }) ??
                const Text("暂无播放"),
            backgroundColor:
                myCustomTheme.colorScheme.primary.withOpacity(0.08),
            scrolledUnderElevation: 0,
          ),
          body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Container(
              color: myCustomTheme.colorScheme.primary.withOpacity(0.08),
              child: Obx(
                () => Stack(
                  alignment: Alignment.center,
                  children: [
                    Visibility(
                        visible: false,
                        child: Align(
                          alignment: Alignment.center,
                          child: audioController.playerIndex.value?.let((it) {
                                final lyricList =
                                    audioController.playerList[it].lyricList;
                                if (lyricList != null) {
                                  return ListView.builder(
                                    controller: scrollController,
                                    itemCount: lyricList.length,
                                    itemExtent: 70,
                                    //强制高度为50.0
                                    physics: const BouncingScrollPhysics(),
                                    // 禁用ListView的默认滚动行为
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                          title: ColorfulTextWidget(
                                              text:
                                                  "${lyricList.elementAt(index).lyric} -- $index",
                                              duration: Duration(
                                                  seconds: (lyricList
                                                              .elementAt(index)
                                                              .endTime -
                                                          lyricList
                                                              .elementAt(index)
                                                              .starTime)
                                                      .toInt()),
                                              shouldStartAnimation:
                                                  audioController.lyricLineIndex
                                                          .value ==
                                                      index));
                                    },
                                    padding: EdgeInsets.only(
                                        bottom: screenHeightHalf),
                                  );
                                } else {
                                  return const Text("暂无歌词");
                                }
                              }) ??
                              const Text("暂无播放"),
                        )),
                    Visibility(
                        visible: audioController.playerIndex.value != null,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                  tag: "cover",
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: audioController.playerIndex.value
                                            ?.let((it) => Image.network(
                                                  audioController.playerList[it]
                                                      .coverImageUrl,
                                                  width: 300,
                                                  height: 300,
                                                  fit: BoxFit.cover,
                                                )) ??
                                        Container(
                                          width: 300,
                                          height: 300,
                                          color: myCustomTheme.primaryColor,
                                        ),
                                  )),
                              const SizedBox(height: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: audioController.playerIndex.value
                                        ?.let((it) => Text(
                                              audioController
                                                  .playerList[it].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )) ??
                                    const Text("暂无播放",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                              ),
                              const SizedBox(height: 5),
                              audioController.playerIndex.value?.let((it) {
                                    final playerItem =
                                        audioController.playerList[it];
                                    if (playerItem.lyricList != null) {
                                      //上面已经判断过了
                                      return Text(playerItem
                                          .lyricList![audioController
                                              .lyricLineIndex.value]
                                          .lyric);
                                    } else {
                                      return const Text("暂无歌词");
                                    }
                                  }) ??
                                  const Text("暂无播放"),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              bottom: 10,
                                              top: 10),
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              thumbShape:
                                                  const RoundSliderThumbShape(
                                                      enabledThumbRadius: 4,
                                                      elevation: 0,
                                                      pressedElevation: 2),
                                              trackHeight: 2,
                                              overlayShape:
                                                  const RoundSliderOverlayShape(
                                                      overlayRadius:
                                                          1), // 取消触摸时滑块外的圆形覆盖
                                            ),
                                            child: Slider(
                                              max: audioController.totalDuration
                                                      .value?.inSeconds
                                                      .toDouble() ??
                                                  0,
                                              value: audioController
                                                  .currentPosition
                                                  .value
                                                  .inSeconds
                                                  .toDouble(),
                                              onChanged: (newValue) {
                                                audioController
                                                    .seek(newValue.toInt());
                                              },
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            audioController
                                                .currentPosition.value.inSeconds
                                                .formatSeconds(),
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                          Text(
                                              audioController.totalDuration
                                                      .value?.inSeconds
                                                      .formatSeconds() ??
                                                  "0:00",
                                              style:
                                                  const TextStyle(fontSize: 10))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                color: myCustomTheme
                                                    .colorScheme.secondary,
                                                Icons.shuffle_rounded)),
                                        IconButton(
                                            onPressed: () {
                                              audioController.playPrevious();
                                            },
                                            icon: Icon(
                                                color: myCustomTheme
                                                    .colorScheme.secondary,
                                                Icons.skip_previous_rounded)),
                                        FloatingActionButton(
                                          elevation: 0,
                                          highlightElevation: 0,
                                          backgroundColor:
                                              myCustomTheme.colorScheme.primary,
                                          child: AnimatedIcon(
                                            icon: AnimatedIcons.pause_play,
                                            progress:
                                                playIconAnimationController,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            if (audioController
                                                .playerState.value.playing) {
                                              audioController.pause();
                                              playIconAnimationController
                                                  .forward();
                                            } else {
                                              audioController.play();
                                              playIconAnimationController
                                                  .reverse();
                                            }
                                          },
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              audioController.playNext();
                                            },
                                            icon: Icon(
                                              Icons.skip_next_rounded,
                                              color: myCustomTheme
                                                  .colorScheme.secondary,
                                            )),
                                        IconButton(
                                            onPressed: () async {
                                              await _showModalBottomSheet();
                                            },
                                            icon: Icon(
                                                color: myCustomTheme
                                                    .colorScheme.secondary,
                                                Icons.queue_music_rounded)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
