import 'package:dio/dio.dart';
import '../../../utils/logger.dart';

/// Interceptor that logs API requests and responses
class LoggingInterceptor extends Interceptor {
  final AppLogger _logger = AppLogger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('API Request', {
      'method': options.method,
      'uri': options.uri.toString(),
      'headers': options.headers,
      'data': options.data,
    });
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('API Response', {
      'statusCode': response.statusCode,
      'uri': response.requestOptions.uri.toString(),
      'data': response.data,
    });
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e('API Error', {
      'type': err.type,
      'message': err.message,
      'statusCode': err.response?.statusCode,
      'uri': err.requestOptions.uri.toString(),
      'data': err.response?.data,
    });
    return handler.next(err);
  }
}
