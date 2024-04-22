import 'package:bili_video_tunes/common/storage/setting_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          )
        ],
      ),
    );
  }
}
