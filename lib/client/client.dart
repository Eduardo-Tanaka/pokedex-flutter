import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class Client {
  Dio init() {
    final String baseUrl = 'https://pokeapi.co/api/v2';
    Dio _dio = new Dio();
    _dio.interceptors.add(DioCacheManager(
      CacheConfig(baseUrl: baseUrl),
    ).interceptor);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, hander) {
          if (null !=
              response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
            print('data come from cache');
          } else {
            print('data come from net');
          }
          return hander.next(response);
        },
        onError: (DioError e, handler) {
          print(e);
          return handler.next(e);
        },
      ),
    );

    _dio.options.baseUrl = baseUrl;
    return _dio;
  }
}
