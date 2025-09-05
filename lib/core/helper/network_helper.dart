import 'package:dio/dio.dart';

abstract class NetworkHelper {
  static final Dio dio = _createDio();
  static const int timeoutDuration = 10;

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: timeoutDuration),
        receiveTimeout: const Duration(seconds: timeoutDuration),
        sendTimeout: const Duration(seconds: timeoutDuration),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final apiKey = '';
          if (apiKey != null) {
            if (options.path.contains('audioscrobbler')) {
              options.queryParameters['api_key'] = apiKey;
            }
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
