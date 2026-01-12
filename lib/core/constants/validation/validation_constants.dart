/// Defines validation rules and constraints for form inputs
class ValidationConstants {
  /// Minimum length for description fields
  static const minDescriptionLength = 3;

  /// Maximum length for description fields
  static const maxDescriptionLength = 100;

  /// Maximum amount for numeric inputs
  static const maxAmount = 999999.99;

  /// Email validation regex pattern
  static const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  /// Password minimum requirements
  static const minPasswordLength = 8;
  static const passwordPattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
}
