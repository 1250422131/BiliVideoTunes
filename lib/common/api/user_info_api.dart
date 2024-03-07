import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/model/network/user/login_user_info.dart';
import 'package:bili_video_tunes/common/model/network/user/player_history_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';

import '../model/network/user/user_created_folder_info.dart';

class UserInfoApi {
  // 获取登录用户信息
  static Future<LoginUserInfo> getLoginUserInfo() async {
    final loginUserInfo = await dioClient.get(loginUserInfoPath);
    return LoginUserInfo.fromJson(loginUserInfo.data);
  }

  static Future<PlayerHistoryInfo> getPlayerHistoryInfo(
      {int? max, int? viewAt, String? business = "archive"}) async {
    final playerHistoryInfo =
        await dioClient.get(playerHistoryPath, queryParameters: {
      "max": max,
      "view_at": viewAt,
      "business": business,
    });
    return PlayerHistoryInfo.fromJson(playerHistoryInfo.data);
  }

  static Future<UserCreatedFolderInfo> getUserCreatedFolderInfo({
    required num mid,
    int pn = 1,
    int ps = 10,
  }) async {
    final userCreatedFolderInfo =
        await dioClient.get(userCreateFolderListPath, queryParameters: {
      "up_mid": mid,
      "pn": pn,
      "ps": ps,
    });
    return UserCreatedFolderInfo.fromJson(userCreatedFolderInfo.data);
  }
}
