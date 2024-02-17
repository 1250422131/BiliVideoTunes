import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/model/network/video/more_player_info.dart';
import 'package:bili_video_tunes/common/model/network/video/video_base_info.dart';
import 'package:bili_video_tunes/common/model/network/video/video_player_dash_info.dart';
import 'package:bili_video_tunes/common/model/network/video/video_subtitle_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';
import 'package:dio/dio.dart';

class VideoApi {


  static Future<VideoBaseInfo> getVideoBaseInfo({required String bvid}) async {
    final result =
        await dioClient.get(getVideoDataPath, queryParameters: {"bvid": bvid});

    return VideoBaseInfo.fromJson(result.data);
  }


  static Future<VideoPlayerDashInfo> getVideoPlayerDashInfo(
      {required String bvid,  int? cid}) async {
    final result = await dioClient.get(videoPlayerDataPath, queryParameters: {
      "bvid": bvid,
      "cid": cid,
      "qn": 64,
      "fnval": 4048,
      "fourk": 1
    });

    return VideoPlayerDashInfo.fromJson(result.data);
  }

  // 获取视频播放者信息
  static Future<MorePlayerInfo> getMorePlayerInfo(
      {required String bvid,
      required int cid,
      int? webLocation,
      int? wRid,
      int? wts}) async {
    final result = await dioClient.get(morePlayerIntoPath, queryParameters: {
      "bvid": bvid,
      "cid": cid,
      "web_location": webLocation,
      "w_rid": wRid,
      "wts": wts
    });

    return MorePlayerInfo.fromJson(result.data);
  }

  // 获取视频字幕
  static Future<VideoSubtitleInfo> getVideoSubtitles(
      {required String uri}) async {
    final result = await dioClient.get(uri);
    return VideoSubtitleInfo.fromJson(result.data);
  }

  // 心跳上报
  static Future<void> postPlayerHeartbeat(
      {num? aid,
      String? bvid,
      num? cid,
      num? epid,
      num? sid,
      num? mid,
      int? playedTime,
      int? realtime,
      int? startTs,
      int? type,
      int? subType,
      int? playType,
      String? csrf}) async {
    csrf = csrf ?? await findCookieValueByName("bili_jct");
    FormData formData = FormData.fromMap({
      "aid": aid,
      "bvid": bvid,
      "cid": cid,
      "epid": epid,
      "sid": sid,
      "mid": mid,
      "played_time": playedTime,
      "realtime": realtime,
      "start_ts": startTs,
      "type": type,
      "sub_type": subType,
      "play_type": playType,
      "csrf": csrf
    });
    final result = await dioClient.post(playerHeartbeatPath, data: formData);
    print(result.data);
  }
}
