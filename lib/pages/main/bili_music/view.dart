
import 'package:flutter/material.dart';

class BiLiMusicPage extends StatefulWidget{
  const BiLiMusicPage({super.key});

  @override
  State<BiLiMusicPage> createState() => _BiLiMusicPageState();

}

class _BiLiMusicPageState extends State<BiLiMusicPage>{

  @override
  Widget build(BuildContext context) {

    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("音频界面")
      ],
    );

  }

}

