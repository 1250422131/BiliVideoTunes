import 'package:bili_video_tunes/common/api/search_info_api.dart';
import 'package:bili_video_tunes/common/model/network/home/search_by_type_result_info.dart';
import 'package:bili_video_tunes/common/model/network/home/search_criteria_emnu.dart';
import 'package:bili_video_tunes/common/model/network/home/search_square_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MainSearchController extends GetxController {
  Rx<SearchSquareInfo> searchQueryInfo = SearchSquareInfo().obs;
  Rx<SearchByTypeResultInfo> searchResultInfo = SearchByTypeResultInfo().obs;

  RxList<Result> searchResultList = RxList.empty();

  Future<void> loadSearchQueryInfo() async {
    final searchQueryInfo = await SearchInfoApi.getSearchSquareInfo();
    this.searchQueryInfo.value = searchQueryInfo;
  }

  Future<void> loadSearchByTypeResultInfo(
      {String searchType = SearchType.video,
      String order = SearchOrder.defaultOrder,
      required String keyword,
      int page = 1,
      bool isClear = false}) async {
    if (isClear) {
      searchResultList.clear();
    }

    final searchQueryInfo = await SearchInfoApi.getSearchByTypeResultInfo(
      searchType: searchType,
      order: order,
      keyword: keyword,
      page: page,
    );

    searchResultInfo.value = searchQueryInfo;

    searchQueryInfo.data?.result?.also((it) {
      searchResultList.addAll(it);
    });
  }

  void closeData() {
    // 销毁时清理资源
    debugPrint("MainSearchController closeData");
    searchQueryInfo.value = SearchSquareInfo();
    searchResultInfo.value = SearchByTypeResultInfo();
    searchResultList.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
