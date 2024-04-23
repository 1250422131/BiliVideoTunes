import 'dart:io';

import 'package:bili_video_tunes/common/controller/user_controller.dart';
import 'package:bili_video_tunes/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class QrLoginDialog extends StatefulWidget {
  const QrLoginDialog({super.key});

  @override
  State<StatefulWidget> createState() => _QrLoginDialogState();
}

class _QrLoginDialogState extends State<QrLoginDialog> {
  late final UserController userController;
  late final QrLoginDialogController controller;

  late Future<void> loginQrcodeFuture;

  @override
  void initState() {
    super.initState();
    userController = Get.find<UserController>();
    controller = Get.put(QrLoginDialogController());
    loginQrcodeFuture = controller.loadLoginQrcodeInfo();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("登录验证"),
      content: Column(
        mainAxisSize: MainAxisSize.min, // 设置主轴尺寸为最小
        children: [
          FutureBuilder(
            future: loginQrcodeFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 当Future还未完成时，显示加载中的UI
                return const SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.network(
                            width: 150,
                            height: 150,
                            "https://pan.misakamoe.com/qrcode/?url=${Uri.encodeComponent(controller.loginQrcodeInfo.value?.data?.url ?? "")}"),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      loginQrcodeFuture = controller.loadLoginQrcodeInfo();
                    });
                  },
                );
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('请使用 "B站" 客户端扫码'),
        ],
      ),
      actions: [
        if (GetPlatform.isMobile)
          TextButton(
            child: const Text("跳转扫码"),
            onPressed: () async {
              await saveNetworkImage(
                  "https://pan.misakamoe.com/qrcode/?url=${Uri.encodeComponent(controller.loginQrcodeInfo.value?.data?.url ?? "")}");
              goToApp(
                name: "B站",
                package: "tv.danmaku.bili",
                path: "bilibili://qrscan",
              );
            }, // 关闭对话框
          ),
        TextButton(
          child: const Text("取消"),
          onPressed: () => Navigator.of(context).pop(), // 关闭对话框
        ),
      ],
    );
  }
}
