/// Core services library
/// Provides various service implementations for the application
library;

// API Services
export 'api/api_client.dart';
export 'api/auth_api.dart';

// Storage Services
export 'storage/secure_storage.dart';

/// Service Features:
///
/// 1. API Services
/// - [ApiClient]: Base HTTP client for making API requests
/// - [AuthApi]: Authentication related API endpoints
///
/// 2. Storage Services
/// - [SecureStorage]: Secure storage implementation for sensitive data
///
/// Usage Example:
/// ```dart
/// final apiClient = ApiClient();
/// final authApi = AuthApi(apiClient);
///
/// // Making an authenticated request
/// await authApi.login(username, password);
///
/// // Storing secure data
/// await SecureStorage.instance.write('token', authToken);
/// ```
