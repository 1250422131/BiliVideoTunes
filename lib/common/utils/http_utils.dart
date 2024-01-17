import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:bili_video_tunes/common/utils/extends.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';

final _cookieJar = CookieJar();

final Dio dioClient = Dio(BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
  contentType: Headers.jsonContentType,
  persistentConnection: true,
))
  ..transformer = BackgroundTransformer()
  ..let((it) {
    if (!kIsWeb) {
      it.interceptors.add(CookieManager(_cookieJar));
      return it;
    } else {
      return it;
    }
  });
