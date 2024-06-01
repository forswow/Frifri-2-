import 'package:dio/dio.dart';

class CountrySearchInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = 'http://autocomplete.travelpayouts.com';
    super.onRequest(options, handler);
  }
}
