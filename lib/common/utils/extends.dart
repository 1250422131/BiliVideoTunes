

import 'package:audio_service/audio_service.dart';
import 'package:bili_video_tunes/common/controller/audio_controller.dart';

extension AlsoExtension<T> on T {
  T also(void Function(T) block) {
    block(this);
    return this;
  }
}

extension LetExtension<T> on T {
  R let<R>(R Function(T) block) {
    return block(this);
  }
}

extension ListExtension<T> on List<T>{
  bool containsByToString(T element){
    int length = this.length;
    for (int i = 0; i < length; i++) {
      if (this[i].toString() == element.toString()) return true;
      if (length != this.length) {
        throw ConcurrentModificationError(this);
      }
    }
    return false;
  }
}


extension AudioMediaItemExtension on AudioMediaItem{

  MediaItem toMediaItem(){
    return  MediaItem(
      id: bvId!,
      title: title,
      displayTitle: title,
      displaySubtitle: bvId,
      displayDescription: description,
      artUri:Uri.parse(coverImageUrl),
    );
  }
}

extension TimeFormatSeconds on int{
  String formatSeconds(){
    int hours = this ~/ 3600;
    int minutes = (this % 3600) ~/ 60;
    int remainingSeconds = this % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hoursStr:$minutesStr:$secondsStr';
    } else {
      return '$minutesStr:$secondsStr';
    }
  }
}

