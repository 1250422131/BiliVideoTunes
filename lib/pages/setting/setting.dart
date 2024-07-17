import 'package:bili_video_tunes/common/storage/setting_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<StatefulWidget> createState() => _Setting();
}

class _Setting extends State<Setting> {
  final SettingStorage storage = Get.put(SettingStorage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("title"),
            subtitle: Text("subTitle"),
            trailing: StatefulBuilder(builder: (context, setState) {
              return Switch(
                value: true,
                onChanged: (value) async {
                },
              );
            }),
          ),
          const ListTile(title:Text("关于项目")),
          ListTile(
            leading: const Icon(Icons.code_rounded),
            title: const Text("GitHub"),
            subtitle: const Text("反馈问题并成为贡献者"),
            onTap: () async {
              final url = Uri.parse("https://github.com/1250422131/BiliVideoTunes");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_police_rounded),
            title: const Text("隐私政策"),
            subtitle: const Text("了解我们如何处理您的信息"),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
