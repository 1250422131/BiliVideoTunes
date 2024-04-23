import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

String formatSeconds(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;

  String hoursStr = hours.toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  if (hours > 0) {
    return '$hoursStr:$minutesStr:$secondsStr';
  } else {
    return '$minutesStr:$secondsStr';
  }
}

Future<void> goToApp(
    {required String name,
    required String package,
    required String path}) async {
  const methodChannel = MethodChannel('openAppChannel');
  var map = {
    'name': name,
    'package': package,
    'path': path,
  };
  return await methodChannel.invokeMethod('openAppChannel', map);
}

Future<dynamic> saveNetworkImage(String imageUrl) async {
  const MethodChannel channel = MethodChannel('SaveFileChannel');

  var response = await Dio()
      .get(imageUrl, options: Options(responseType: ResponseType.bytes));

  final result = await channel.invokeMethod(
      'saveImageToGallery', <String, dynamic>{
    'imageBytes': Uint8List.fromList(response.data),
    'quality': 60,
    'name': "bvd_qrcode",
    'child':'bvd',
  });


  return result;
}
