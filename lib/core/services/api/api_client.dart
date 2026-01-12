import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../storage/secure_storage.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

/// A singleton class that manages API requests using Dio
class ApiClient {
  static const int _timeoutSeconds = 30;
  static const String _baseUrl =
      'https://api.example.com'; // Replace with your API URL

  late final Dio _dio;
  final SecureStorage _secureStorage;

  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  ApiClient._internal() : _secureStorage = SecureStorage() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: _timeoutSeconds),
        receiveTimeout: const Duration(seconds: _timeoutSeconds),
        sendTimeout: const Duration(seconds: _timeoutSeconds),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    // Clear any existing interceptors
    _dio.interceptors.clear();

    // Add interceptors in the desired order
    _dio.interceptors.addAll([
      AuthInterceptor(_secureStorage),
      RetryInterceptor(),
      if (kDebugMode) LoggingInterceptor(),
    ]);
  }

  /// Performs a GET request
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Performs a POST request
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Performs a PUT request
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Performs a DELETE request
  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data as T;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Handles API errors and converts them to user-friendly messages
  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return TimeoutException('Connection timed out');
        case DioExceptionType.badResponse:
          return _handleHttpError(error.response?.statusCode);
        case DioExceptionType.cancel:
          return Exception('Request cancelled');
        default:
          return Exception('Network error occurred');
      }
    }
    return Exception('An unexpected error occurred');
  }

  /// Handles HTTP status code errors
  Exception _handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return Exception('Bad request');
      case 401:
        return Exception('Unauthorized');
      case 403:
        return Exception('Forbidden');
      case 404:
        return Exception('Not found');
      case 500:
        return Exception('Internal server error');
      default:
        return Exception('Server error occurred');
    }
  }
}
