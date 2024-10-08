/// 歌词Model
/// 特别的，此Model需要由其他Model转换而来
class LyricData {
  final String lyric;
  final String? translate;
  final num starTime;
  final num endTime;
  final num duration;

  LyricData(
      {required this.lyric,
      this.translate,
      required this.duration,
      required this.starTime,
      required this.endTime});
}
