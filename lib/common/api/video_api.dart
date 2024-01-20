import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/model/network/video/video_base_info.dart';
import 'package:bili_video_tunes/common/model/network/video/video_player_dash_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';

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
}
