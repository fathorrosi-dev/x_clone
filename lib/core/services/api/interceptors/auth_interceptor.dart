import 'package:dio/dio.dart';
import '../../storage/secure_storage.dart';

/// Interceptor that handles authentication tokens
class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;
  bool _isRefreshing = false;

  AuthInterceptor(this._secureStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final newToken = await _refreshToken();
        if (newToken != null) {
          // Retry the failed request with the new token
          final opts = err.requestOptions;
          opts.headers['Authorization'] = 'Bearer $newToken';
          final response = await Dio().fetch(opts);
          return handler.resolve(response);
        }
      } catch (e) {
        return handler.reject(err);
      } finally {
        _isRefreshing = false;
      }
    }
    return handler.next(err);
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _secureStorage.getRefreshToken();
      if (refreshToken == null) return null;

      final dio = Dio();
      final response = await dio.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final newToken = response.data?['access_token'] as String?;
      if (newToken != null) {
        await _secureStorage.setAccessToken(newToken);
        return newToken;
      }
      return null;
    } catch (e) {
      await _secureStorage.clearTokens();
      return null;
    }
  }
}
