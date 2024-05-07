import 'package:bili_video_tunes/common/controller/audio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:just_audio/just_audio.dart';

class BiliAudioService extends GetxService {
  // 播放任务列表
  RxList<AudioMediaItem> playerList = <AudioMediaItem>[].obs;

  // 播放状态
  Rx<PlayerState> playerState = PlayerState(false, ProcessingState.idle).obs;

  // 当前播放进度
  Rx<Duration> currentPosition = (Duration.zero).obs;

  // 总播放进度
  Rx<Duration?> totalDuration = Rx<Duration?>(null);

  // 播放指标
  Rx<int?> playerIndex = Rx<int?>(null);

  // 循环模式
  Rx<LoopMode> loopModel = (LoopMode.off).obs;

  // 歌词位置
  Rx<int> lyricLineIndex = 0.obs;

  // 歌曲主题
  Rx<ColorScheme> audioLightColorScheme =
      (ColorScheme.fromSeed(seedColor: Colors.deepPurple)).obs;

  Rx<ColorScheme> audioDarkColorScheme = (ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, brightness: Brightness.dark))
      .obs;

  Rx<AnimationController?> singleLyricAnimationController = Rx<AnimationController?>(null);
}
