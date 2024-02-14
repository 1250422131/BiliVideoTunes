import 'dart:async';

import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/api/user_info_api.dart';
import 'package:bili_video_tunes/common/api/user_login_api.dart';
import 'package:bili_video_tunes/common/controller/user_controller.dart';
import 'package:bili_video_tunes/common/model/network/user/login_poll_info.dart';
import 'package:bili_video_tunes/common/model/network/user/login_qrcode_info.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:bili_video_tunes/common/utils/http_utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class QrLoginDialogController extends GetxController {
  Rx<LoginQrcodeInfo?> loginQrcodeInfo = Rx<LoginQrcodeInfo?>(null);
  late Timer loginPollTimer;
  UserController userController = Get.find<UserController>();

  Future<void> loadLoginQrcodeInfo() async {
    final data = await UserLoginApi.getLoginQrcodeInfo();
    loginQrcodeInfo.value = data;
  }

  Future<LoginPollInfo> loadLoginPollInfo({required String qrcodeKey}) async {
    final data = await UserLoginApi.getLoginPollInfo(qrcodeKey: qrcodeKey);

    return data;
  }

  @override
  void onInit() {
    startLoginPollTimer();
    super.onInit();
  }

  @override
  void dispose() {
    stopLoginPollTimer();
    super.dispose();
  }

  @override
  void onClose() {
    stopLoginPollTimer();
    super.onClose();
  }

  void startLoginPollTimer() {
    const pollInterval = Duration(seconds: 5);
    loginPollTimer = Timer.periodic(pollInterval, (_) {
      loginQrcodeInfo.value?.also((it) async {
        final pollInfo =
            await loadLoginPollInfo(qrcodeKey: it.data!.qrcodeKey!);
        if ((pollInfo.data?.code ?? -1) == 0) {
          // 登录完成
          Get.back();
          stopLoginPollTimer();
          callSetLoginUserData();
        }
      });
    });
  }

  Future<void> callSetLoginUserData() async {
    final result = await UserInfoApi.getLoginUserInfo();
    await dioClient.get(bliUrl);
    if(result.code == 0){
      userController.loginUserData.value = result.data;
    }
  }

  void stopLoginPollTimer() {
    loginPollTimer.cancel();
    // 置空内容
    loginQrcodeInfo.value = null;
  }
}
