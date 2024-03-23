import 'dart:io';

import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/api/interceptor/login_api_interceptor.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

final Dio dioClient = Dio(BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
  contentType: Headers.jsonContentType,
  persistentConnection: true,
))
  ..transformer = BackgroundTransformer()
  ..interceptors.add(LoginApiInterceptor());

late PersistCookieJar _cookieJar;

Future<void> initCookieJar() async {

  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final mCookieJar = PersistCookieJar(
    storage: FileStorage("${appDocumentsDir.path}/user/cookies"),
    ignoreExpires: true,
  );

  // WEB需要移除，Web交由浏览器自行管理Cookie
  if(kIsWeb){
    dioClient.interceptors.add(CookieManager(mCookieJar));
    _cookieJar = mCookieJar;
  }

}


Future<String?> findCookieValueByName(String name) async{
  final cookies = await _cookieJar.loadForRequest(Uri.parse(bliUrl));
  return cookies.where((element) => element.name == name).firstOrNull?.value;
}