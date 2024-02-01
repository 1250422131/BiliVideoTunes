

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

