import 'package:dio/dio.dart';

/// Interceptor that handles retry logic for failed requests
class RetryInterceptor extends Interceptor {
  static const int _maxRetries = 3;
  static const Duration _retryDelay = Duration(seconds: 1);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final extra = err.requestOptions.extra;
    final retryCount = (extra['retryCount'] as int?) ?? 0;

    if (_shouldRetry(err) && retryCount < _maxRetries) {
      await Future.delayed(_retryDelay * (retryCount + 1));

      try {
        final opts = err.requestOptions;
        opts.extra['retryCount'] = retryCount + 1;

        final response = await Dio().fetch(opts);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        (error.response?.statusCode ?? 0) >= 500;
  }
}
