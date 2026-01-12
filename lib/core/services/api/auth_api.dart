import '../storage/secure_storage.dart';
import 'api_client.dart';

/// Service that handles authentication-related API requests
class AuthApi {
  final ApiClient _apiClient;
  final SecureStorage _secureStorage;

  AuthApi({ApiClient? apiClient, SecureStorage? secureStorage})
    : _apiClient = apiClient ?? ApiClient(),
      _secureStorage = secureStorage ?? SecureStorage();

  /// Logs in a user with email and password
  Future<bool> login(String email, String password) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      final accessToken = response['access_token'] as String?;
      final refreshToken = response['refresh_token'] as String?;

      if (accessToken != null && refreshToken != null) {
        await Future.wait([
          _secureStorage.setAccessToken(accessToken),
          _secureStorage.setRefreshToken(refreshToken),
        ]);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Logs out the current user
  Future<void> logout() async {
    try {
      await _apiClient.post<void>('/auth/logout');
    } finally {
      await _secureStorage.clearTokens();
    }
  }

  /// Registers a new user
  Future<bool> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/register',
        data: {'email': email, 'password': password, 'name': name},
      );

      return response['success'] as bool? ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Sends a password reset email
  Future<bool> forgotPassword(String email) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/forgot-password',
        data: {'email': email},
      );

      return response['success'] as bool? ?? false;
    } catch (e) {
      return false;
    }
  }

  /// Checks if the user is currently authenticated
  Future<bool> isAuthenticated() async {
    final token = await _secureStorage.getAccessToken();
    return token != null;
  }
}
