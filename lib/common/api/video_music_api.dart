import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/model/network/video_music/new_list_rank_info.dart';
import 'package:bili_video_tunes/common/model/network/video_music/new_video_dynamic_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';

import '../model/network/video_music/host_info.dart';

class VideoMusicApi {
  static Future<HostInfo> getHostInfo(
      {required num rid, required num type}) async {
    final result = await dioClient
        .get(videoMusicHotsPath, queryParameters: {"rid": rid, "type": type});

    return HostInfo.fromJson(result.data);
  }

  static Future<NewVideoDynamicInfo> getNewVideoDynamicInfo({
    required num rid,
    required num pn,
    required num ps,
  }) async {
    final result = await dioClient.get(newVideoDynamicPath,
        queryParameters: {"rid": rid, "pn": pn, "ps": ps});

    return NewVideoDynamicInfo.fromJson(result.data);
  }

  static Future<NewVideoDynamicInfo> getNewVideoDynamicTagInfo({
    required num rid,
    required num tagId,
    required num pn,
    required num ps,
  }) async {
    final result = await dioClient.get(newVideoDynamicTagePath,
        queryParameters: {"rid": rid, "pn": pn, "ps": ps, "tag_id": tagId});

    return NewVideoDynamicInfo.fromJson(result.data);
  }

  static Future<NewListRankInfo> getNewRankInfo(
      {required num cateId,
      required num page,
      required num pageSize,
      required num timeFrom,
      required num timeTo,
      String? keyword}) async {
    final result = await dioClient.get(videoNewRankPath, queryParameters: {
      "main_ver": "v3",
      "search_type": "video",
      "view_type": "hot_rank",
      "order": "click",
      "copy_right": -1,
      "new_web_tag": 1,
      "cate_id": cateId,
      "page": page,
      "pagesize": pageSize,
      "time_from": timeFrom,
      "time_to": timeTo,
      "keyword": keyword
    });

    return NewListRankInfo.fromJson(result.data);
  }
}
