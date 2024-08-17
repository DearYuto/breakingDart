import 'package:calculator/validation/validators/abstract_validator.dart';

class InputValidator<T> extends AbstractValidator<T> {
  List<AbstractValidator<T>> validators;

  InputValidator(this.validators);

  @override
  ValidationResult validate(T value) {
    for (var validator in validators) {
      final ValidationResult result = validator.validate(value);
      if (!result.isValid) {
        return result;
      }
    }

    return ValidationResult(true);
  }
}
