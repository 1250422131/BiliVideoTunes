import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:dio/dio.dart';

/// 此监听器用于拦截替换账户登录的接口
class LoginApiInterceptor implements Interceptor{

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 替换BaseUrl
    if(options.uri.path.contains("passport-login")){
      options.baseUrl = passportBaseUrl;
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

}