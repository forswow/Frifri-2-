import 'package:dio/dio.dart';
import 'package:frifri/src/feature/shared/data/dto/user_location.dart';

abstract interface class IUserLocationDataSource {
  Future<UserLocation> getUserLocation({required UserLocationQuery options});
}

class UserLocationDataSourceImpl implements IUserLocationDataSource {
  final Dio _dio;

  UserLocationDataSourceImpl({required Dio dioClient}) : _dio = dioClient;

  @override
  Future<UserLocation> getUserLocation(
      {required UserLocationQuery options}) async {
    const String endpoint = 'http://www.travelpayouts.com/whereami';
    final allOptions = options.toJson()
      ..removeWhere((key, value) => value == null);
    final response = await _dio.get(endpoint, queryParameters: allOptions);
    final result = response.data;
    return UserLocation.fromJson(result);
  }
}
