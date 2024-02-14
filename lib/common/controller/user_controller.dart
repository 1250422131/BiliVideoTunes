import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/api/user_info_api.dart';
import 'package:bili_video_tunes/common/model/network/user/login_user_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<Data?> loginUserData = Rx<Data?>(null);

  Future<void> initLoginUserData() async {
    // 获取webi
    await dioClient.get(bliUrl);
    final result = await UserInfoApi.getLoginUserInfo();
    if (result.code == 0) {
      loginUserData.value = result.data;
    } else {
      loginUserData.value = null;
    }
  }
}
