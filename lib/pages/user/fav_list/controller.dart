import 'package:bili_video_tunes/common/api/fav_api.dart';
import 'package:bili_video_tunes/common/model/network/user/fav_resource_list_info.dart';
import 'package:get/get.dart';

class FavListController extends GetxController {
  final favListInfo = FavResourceListInfo().obs;
  final favList = <Medias>[].obs;

  Future<void> loadFavList({
    required int mediaId,
    int? tid,
    String? keyword,
    String? order,
    int? type,
    int ps = 20,
    int pn = 1,
    String platform = "web",
    isClear = false,
  }) async {
    if (isClear) {
      favList.clear();
    }

    final result = await FavApi.getFavResourceInfoList(
      mediaId: mediaId,
      tid: tid,
      keyword: keyword,
      order: order,
      type: type,
      ps: ps,
      pn: pn,
      platform: platform,
    );

    favListInfo.value = result;
    favList.addAll(result.data?.medias ?? []);
  }

  Future<void> initFavList({required int mediaId}) async {
    await loadFavList(mediaId: mediaId, isClear: true);
  }
}
