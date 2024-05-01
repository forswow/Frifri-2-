import 'package:dio/dio.dart';

Dio getBasicDioClient(String _baseUrl, String _apiKey) {
  // Use GZIP because it's much faster than deflate

  final testDio = Dio(
    BaseOptions(
      headers: {
        'X-Access-Token': _apiKey,
        'Accept-Encoding': 'gzip',
      },
      baseUrl: _baseUrl,
    ),
  );

  return testDio;
}
