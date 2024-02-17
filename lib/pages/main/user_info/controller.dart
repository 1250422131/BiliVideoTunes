import 'package:bili_video_tunes/common/model/network/user/player_history_info.dart';
import 'package:get/get.dart';
import 'package:bili_video_tunes/common/api/user_info_api.dart';
import 'package:bili_video_tunes/common/model/network/user/login_user_info.dart' as user_info;

class UserInfoPageController extends GetxController {

  Rx<user_info.Data?> myUserData = Rx<user_info.Data?>(null);

  RxList<MList> playerHistoryList = <MList>[].obs;

  Future<void> initMeUserData() async {
    final result = await UserInfoApi.getLoginUserInfo();
    if (result.code == 0) {
      myUserData.value = result.data;
    } else {
      myUserData.value = null;
    }
  }

  Future<void> initPlayerHistory() async {
    final result = await UserInfoApi.getPlayerHistoryInfo();
    if (result.code == 0) {
      playerHistoryList.value = result.data!.list ?? <MList>[];
    }
  }


}
