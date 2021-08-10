import 'package:dio/dio.dart';

class Client {
  Dio init() {
    Dio _dio = new Dio();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, hander) {
          return hander.next(response);
        },
        onError: (DioError e, hanlder) {
          return hanlder.next(e);
        },
      ),
    );

    _dio.options.baseUrl = 'https://pokeapi.co/api/v2';
    return _dio;
  }
}
