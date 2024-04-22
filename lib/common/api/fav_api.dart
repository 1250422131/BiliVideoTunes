import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/model/network/user/fav_resource_list_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';

class FavApi {
  static Future<FavResourceListInfo> getFavResourceInfoList({
    required int mediaId,
    int? tid,
    String? keyword,
    String? order,
    int? type,
    int? ps,
    int? pn,
    String platform = "web",
  }) async {
    final result = await dioClient.get(favResourceListPath, queryParameters: {
      "media_id": mediaId,
      "tid": tid,
      "keyword": keyword,
      "order": order,
      "type": type,
      "ps": ps,
      "pn": pn,
      "platform": platform,
    });

    return FavResourceListInfo.fromJson(result.data);

  }
}
