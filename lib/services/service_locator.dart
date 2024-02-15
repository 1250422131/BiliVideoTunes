import 'package:audio_service/audio_service.dart';
import 'package:bili_video_tunes/common/handler/bili_audio_handler.dart';




Future<BiliAudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => BiliAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.imcys.bilivideotunes.biliAudio',
      androidNotificationChannelName: 'BiliVideoTunes Service',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
}
