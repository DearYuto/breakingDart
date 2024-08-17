import 'package:calculator/validation/abstract_validator.dart';

class EmptyValidator extends AbstractValidator<String> {
  @override
  ValidationResult validate(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationResult(false, '빈 값은 입력할 수 없습니다.');
    }
    return ValidationResult(true);
  }
}
