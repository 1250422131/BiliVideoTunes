import 'package:bili_video_tunes/common/controller/user_controller.dart';
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
          const Text("请使用B站客户端完成扫码"),
          Container(
            height: 10,
          ),
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
                  child: Image.network(
                      width: 150,
                      height: 150,
                      "https://pan.misakamoe.com/qrcode/?url=${controller.loginQrcodeInfo.value?.data?.url ?? ""}"),
                  onTap: ()  {
                    setState(() {
                      loginQrcodeFuture = controller.loadLoginQrcodeInfo();
                    });
                  },
                );
              }
            },
          )
        ],
      ),
      actions: [
        TextButton(
          child: const Text("取消"),
          onPressed: () => Navigator.of(context).pop(), // 关闭对话框
        ),

      ],
    );
  }
}
