import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class ApiService {
  Future<Map<String, dynamic>> get({required String path}) async {
    try {
      final response = await Dio().get(path);
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
