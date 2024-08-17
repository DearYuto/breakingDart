import 'package:calculator/validation/abstract_validator.dart';

class NumberFormatValidator extends AbstractValidator<String> {
  @override
  ValidationResult validate(String value) {
    if (double.tryParse(value) == null) {
      return ValidationResult(false, '숫자 형식으로 입력해주세요.');
    }

    return ValidationResult(true);
  }
}
