import 'dart:io';

import 'package:desafio_wk_technology/service/http_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class HttpService {
  final Dio dio = Dio();

  HttpService() {
    dio.interceptors.add(HttppInterceptors());
  }
 prepareDio() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
  Future<Response> get(url, path) async {
    dio.options.baseUrl = url;
    return dio.get(path);
  }

  Future<Response> post(url, path, Object body) async {
    dio.options.baseUrl = url;
    return dio.post(path, data: body);
  }

  Future<Response> delete(url, Map<String, dynamic>? queryParameters) async {
    dio.options.baseUrl = url;
    return dio.delete(url, queryParameters: queryParameters);
  }

  Future<Response> remove(url, body) async {
    dio.options.baseUrl = url;
    return dio.delete(url, data: body);
  }

  Future<Response> put(url, Object body) {
    dio.options.baseUrl = url;
    return dio.put('', data: body);
  }

  Future<Response> getEntity(url) async {
    return dio.get(url);
  }

  getByQueryParam(String url, String query) async {
    return dio.get('$url?$query');
  }
}
