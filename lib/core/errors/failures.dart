import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError() = _ServerError;
  const factory Failure.networkError() = _NetworkError;
  const factory Failure.invalidData() = _InvalidData;
  const factory Failure.unauthorized() = _Unauthorized;
  const factory Failure.notFound() = _NotFound;
  const factory Failure.unknown() = _Unknown;

  @override
  String toString() {
    return when(
      serverError: () => 'Server error occurred',
      networkError: () => 'Network error occurred',
      invalidData: () => 'Invalid data provided',
      unauthorized: () => 'Unauthorized access',
      notFound: () => 'Resource not found',
      unknown: () => 'An unknown error occurred',
    );
  }
}
