import '../constants/game_rules.dart';

class InputValidator {
  InputValidator._();

  static bool validRange(String numbers) {
    final List<int> splittedNumbers =
        numbers.split('').map((number) => int.parse(number)).toList();

    return splittedNumbers.every((number) {
      return number >= GameRules.MIN_NUM && number <= GameRules.MAX_NUM;
    });
  }
}
