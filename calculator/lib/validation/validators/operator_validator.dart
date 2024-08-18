import 'package:calculator/validation/abstract_validator.dart';

class OperatorValidator extends AbstractValidator<String> {
  @override
  ValidationResult validate(String value) {
    if (value != '+' && value != '-' && value != '*' && value != '/') {
      return ValidationResult(false, '연산자는(+, -, *, /)만 입력 가능합니다.');
    }

    return ValidationResult(true);
  }
}
