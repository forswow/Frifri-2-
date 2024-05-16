import 'package:dio/dio.dart';

base mixin class Network {
  final dioClient = Dio(
    BaseOptions(
      headers: {
        'X-Access-Token': '31c30d4e58d9cd3a3dc5cd2b8123e1b1',
        'Accept-Encoding': 'gzip',
      },
      baseUrl: 'https://api.travelpayouts.com',
    ),
  );
}

Dio getBasicDioClient(String _baseUrl, String _apiKey) {
  // Use GZIP because it's much faster than deflate
  // for the api
  final dioClient = Dio(
    BaseOptions(
      headers: {
        'X-Access-Token': _apiKey,
        'Accept-Encoding': 'gzip',
      },
      baseUrl: _baseUrl,
    ),
  );

  return dioClient;
}
