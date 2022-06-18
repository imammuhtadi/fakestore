import 'package:dio/dio.dart';
import 'package:fakestore/config/config.dart';

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class ApiService {
  Future<dynamic> get({required String path}) async {
    try {
      final response = await Dio().get(ConfigApps.baseUrl + path);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Failure("Failed to get data");
      }
    } on DioError catch (e) {
      throw Failure(e.response!.statusCode.toString());
    }
  }
}
