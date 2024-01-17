

import 'package:flutter/cupertino.dart';

class UserInfoPage extends StatefulWidget{
  const UserInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _UserInfoPageState();

}

class _UserInfoPageState extends State<UserInfoPage>{

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("音频界面")
      ],
    );
  }

}