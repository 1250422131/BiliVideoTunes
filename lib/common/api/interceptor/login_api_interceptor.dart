import 'package:bili_video_tunes/common/api/api_path.dart';
import 'package:dio/dio.dart';

/// 此监听器用于拦截替换账户登录的接口
class LoginApiInterceptor implements Interceptor{

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // 替换BaseUrl
    if (options.uri.path.contains("passport-login")) {
      options.baseUrl = passportBaseUrl;
    }else if(options.uri.path.contains(suggestSearchInfo)){
      // 替换搜索接口
      options.baseUrl = searchUrl;
    } else if (options.uri.path == bliUrl) {
      // 替换B站主站结课
      options.contentType = "";
      options.baseUrl = bliUrl;
      options.path = "";
      options.responseType = ResponseType.bytes;
    } else if (options.uri.path.contains("ai_subtitle/prod")) {
      // 替换AI字幕网络请求
      options.baseUrl = aiSubtitleUrl;
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

}