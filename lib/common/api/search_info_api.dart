import 'package:bili_video_tunes/common/model/network/home/search_by_type_result_info.dart';
import 'package:bili_video_tunes/common/model/network/home/search_criteria_emnu.dart';
import 'package:bili_video_tunes/common/model/network/home/search_default_info.dart';
import 'package:bili_video_tunes/common/model/network/home/search_square_info.dart';
import 'package:bili_video_tunes/common/model/network/home/search_suggest_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';

import 'api_path.dart';

class SearchInfoApi {

  static Future<SearchDefaultInfo> getSearchDefaultInfo() async {
    final response = await dioClient.get(searchDefaultInfo);
    return SearchDefaultInfo.fromJson(response.data);
  }

  static Future<SearchSquareInfo> getSearchSquareInfo({
    int limit = 10,
    String platform = "web",
  }) async {
    final response = await dioClient.get(searchRankInfo, queryParameters: {
      "limit": limit,
      "platform": platform,
      "wts": DateTime.now().millisecondsSinceEpoch
    });
    return SearchSquareInfo.fromJson(response.data);
  }

  static Future<SearchByTypeResultInfo> getSearchByTypeResultInfo({
    String searchType = SearchType.video,
    String order = SearchOrder.defaultOrder,
    required String keyword,
    int page = 1,
  }) async {
    final response = await dioClient.get(searchByTypeInfo, queryParameters: {
      "search_type": searchType,
      "order": order,
      "keyword": keyword,
      "page": page,
    });
    return SearchByTypeResultInfo.fromJson(response.data);
  }

  static Future<SearchSuggestInfo> getSearchSuggestInfo({
    String? term,
  }) async {
    final response = await dioClient.get(suggestSearchInfo, queryParameters: {
      "term": term,
    });
    return SearchSuggestInfo.fromJson(response.data);
  }
}
