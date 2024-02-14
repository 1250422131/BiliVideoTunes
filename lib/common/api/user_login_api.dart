import 'package:bili_video_tunes/common/model/network/user/login_poll_info.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';

import '../model/network/user/login_qrcode_info.dart';
import 'api_path.dart';

class UserLoginApi {
  static Future<LoginQrcodeInfo> getLoginQrcodeInfo() async {
    final result = await dioClient.get(loginQrcodeGeneratePath);
    return LoginQrcodeInfo.fromJson(result.data);
  }

  static Future<LoginPollInfo> getLoginPollInfo(
      {required String qrcodeKey}) async {
    final result = await dioClient
        .get(loginQrcodePollPath, queryParameters: {"qrcode_key": qrcodeKey});
    return LoginPollInfo.fromJson(result.data);
  }

}
