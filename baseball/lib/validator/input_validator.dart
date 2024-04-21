import 'package:baseball/constants/game_rules.dart';

class InputValidator {
  InputValidator._();

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
