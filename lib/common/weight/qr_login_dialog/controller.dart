
import 'package:bili_video_tunes/common/api/user_login_api.dart';
import 'package:get/get.dart';

import '../../model/network/user/login_qrcode_info.dart';

class QrLoginDialogController extends GetxController{

  Rx<LoginQrcodeInfo?> loginQrcodeInfo = Rx<LoginQrcodeInfo?>(null);



  Future<void> loadLoginQrcodeInfo()async {
    final data = await UserLoginApi.getLoginQrcodeInfo();
    loginQrcodeInfo.value = data;
  }

}