class ValidationResult {
  static const String _defaultValidMessage = "valid";
  final bool isValid;
  final String? errorMessage;

  ValidationResult(this.isValid, [this.errorMessage = _defaultValidMessage]);
}

abstract class AbstractValidator<T> {
  ValidationResult validate(T value);
}
