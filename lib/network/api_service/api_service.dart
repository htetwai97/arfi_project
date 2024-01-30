import 'package:dio/dio.dart';

class DioUtil {
  static Dio getDio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
        contentType: 'application/json',
        headers: {'Accept': 'application/json; charset=UTF-8'},
      ),
    );
    return dio;
  }
}
