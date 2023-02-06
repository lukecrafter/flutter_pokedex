import 'package:dio/dio.dart';

class ApiClient {
  late Dio dio;

  ApiClient._internal() {
    dio = createDio();
  }

  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  static Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        receiveTimeout: 15000, // 15 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
        validateStatus: (int? status) =>
            (status != null && status >= 200 && status < 400) || status == 404,
      ),
    );

    return dio;
  }
}
