import 'package:dio/dio.dart';

class HttppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // options.headers
    // .addAll({HttpHeaders.authorizationHeader: tokenAccess.toString()});
    options.headers.addAll({'Access-Token': ''});
    options.headers.addAll({'Accept': 'application/json'});
    options.headers.addAll({'Content-Type': 'application/json'});
    super.onRequest(options, handler);
  }
}
