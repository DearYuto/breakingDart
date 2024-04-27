import 'package:baseball/constants/error_messages.dart';
import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/validator/validation_result.dart';

class InputValidator {
  InputValidator._();

  static ValidationResult validateAll<T>(
    List<T> inputs, {
    required bool Function(T) conditionCb,
    int length = GameRules.answerLength,
  }) {
    try {
      //빈 값 검증
      if (isEmpty(inputs)) {
        throw const FormatException(ErrorMessageConstants.emptyInput);
      }

      // int 타입인지 검증
      if (!isNumbers(inputs)) {
        throw const FormatException(ErrorMessageConstants.notANumber);
      }

      // 입력한 숫자 범위 검증
      if (!validRange(inputs, conditionCb)) {
        throw const FormatException(ErrorMessageConstants.invalidRange);
      }

      // 유니크 검증
      if (!isUniqueList(inputs)) {
        throw const FormatException(ErrorMessageConstants.invalidUnique);
      }

      // 길이 검증
      if (!validLength(inputs, length: length)) {
        throw const FormatException(ErrorMessageConstants.invalidLength);
      }
    } catch (e) {
      return ValidationResult(
        valid: false,
        reason: e is FormatException ? e.message : e.toString(),
      );
    }

    // 모든 검증 통과
    return ValidationResult(valid: true);
  }

  static bool validReGameCommand(String input) {
    return input == GameRules.regameCommand || input == GameRules.exitCommand;
  }

  static bool isNumbers<T>(List<T> inputs) {
    return inputs.every((input) => input is int);
  }

  static bool isEmpty<T>(List<T> inputs) {
    return inputs.isEmpty;
  }

  static bool validRange<T>(
    List<T> inputs,
    bool Function(T) conditionCb,
  ) {
    return inputs.every(conditionCb);
  }

  static bool isUniqueList<T>(List<T> inputs) {
    final Set<T> inputSet = Set<T>.from(inputs);

    return inputSet.length == inputs.length;
  }

  static bool validLength<T>(
    List<T> inputs, {
    int length = GameRules.answerLength,
  }) {
    return inputs.length == length;
  }
}
