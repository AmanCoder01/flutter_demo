import 'package:dio/dio.dart';

class DioClient {
  static Dio create() {
    final dio = Dio();

    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return dio;
  }
}
