import 'package:calculator/validation/abstract_validator.dart';

class RangeValidator extends AbstractValidator<double> {
  final double min;
  final double max;

  RangeValidator(this.min, this.max);

  @override
  ValidationResult validate(double value) {
    if (value < min || value > max) {
      return ValidationResult(false, '유효 범위($min ~ $max)를 벗어났습니다.');
    }

    return ValidationResult(true);
  }
}
