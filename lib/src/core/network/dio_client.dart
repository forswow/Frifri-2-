import 'package:dio/dio.dart';

base mixin class Network {
  final dioClient = Dio(
    BaseOptions(
      headers: {
        'X-Access-Token': '31c30d4e58d9cd3a3dc5cd2b8123e1b1',
        'Accept-Encoding': 'gzip',
      },
      followRedirects: true,
      // baseUrl: 'https://api.travelpayouts.com',
      validateStatus: (status) {
        return status != null;
        // return status != null && status >= 200 && status < 300;
      },
    ),
  )..interceptors.addAll([
      ErrorInterceptor(),
    ]);
}

Dio getBasicDioClient(String baseUrl, String apiKey) {
  // Use GZIP because it's much faster than deflate
  // for the api
  final dioClient = Dio(
    BaseOptions(
      followRedirects: true,
      headers: {
        'X-Access-Token': apiKey,
        'Accept-Encoding': 'gzip',
      },
      validateStatus: (status) {
        return status != null;
        // return status != null && status >= 200 && status < 300;
      },
      baseUrl: baseUrl,
    ),
  )..interceptors.addAll([
      ErrorInterceptor(),
    ]);

  return dioClient;
}

final class DioEnv {
  static const apiKey = '31c30d4e58d9cd3a3dc5cd2b8123e1b1';
  static const baseUrl = 'http://api.travelpayouts.com';
  static const marker = '406687';
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 307;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}
