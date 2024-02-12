import 'package:bili_video_tunes/common/utils/http_utils.dart';

import '../model/network/user/login_qrcode_info.dart';
import 'api_path.dart';

class UserLoginApi {
  static Future<LoginQrcodeInfo>  getLoginQrcodeInfo() async {
    final result = await dioClient.get(loginQrcodeGeneratePath);
    return LoginQrcodeInfo.fromJson(result.data);
  }
}
