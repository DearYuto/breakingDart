import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/validator/validation_result.dart';

import '../constants/error_messages.dart';

class InputValidator {
  InputValidator._();

  static ValidationResult validateAll<T>(List<T> inputs,
      {required bool Function(T) conditionCb,
      int length = GameRules.answerLength}) {
    try {
      //빈 값 검증
      if (isEmpty(inputs))
        throw FormatException(ErrorMessageConstants.emptyInput);

      // int 타입인지 검증
      if (!isNumbers(inputs))
        throw FormatException(ErrorMessageConstants.notANumber);

      // 입력한 숫자 범위 검증
      if (!validRange(inputs, conditionCb))
        throw FormatException(ErrorMessageConstants.invalidRange);

      // 유니크 검증
      if (!isUniqueList(inputs))
        throw FormatException(ErrorMessageConstants.invalidUnique);

      // 길이 검증
      if (!validLength(inputs, length: length))
        throw FormatException(ErrorMessageConstants.invalidLength);
    } catch (e) {
      return ValidationResult(
          valid: false,
          reason: e is FormatException ? e.message : e.toString());
    }

    // 모든 검증 통과
    return ValidationResult(valid: true);
  }

  static bool isNumbers<T>(List<T> inputs) {
    return inputs.every((input) => input is int);
  }

  static bool isEmpty<T>(List<T> inputs) {
    return inputs.length == 0;
  }

  static bool validRange<T>(List<T> inputs, bool Function(T) conditionCb) {
    return inputs.every(conditionCb);
  }

  static bool isUniqueList<T>(List<T> inputs) {
    Set<T> inputSet = Set<T>.from(inputs);

    return inputSet.length == inputs.length;
  }

  static bool validLength<T>(List<T> inputs,
      {int length = GameRules.answerLength}) {
    return inputs.length == length;
  }
}
