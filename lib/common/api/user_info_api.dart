import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/model/network/user/login_user_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';

class UserInfoApi {
  // 获取登录用户信息
  static Future<LoginUserInfo> getLoginUserInfo() async {
    final loginUserInfo = await dioClient.get(loginUserInfoPath);
    return LoginUserInfo.fromJson(loginUserInfo.data);
  }
}
