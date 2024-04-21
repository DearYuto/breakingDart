import 'dart:io';

import 'package:baseball/constants/error_messages.dart';
import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/constants/messages.dart';
import 'package:baseball/utils/string_utils.dart';
import 'package:baseball/validator/input_validator.dart';

class GameManager {
  GameManager() {}

  void initGame() {
    print(MessageConstants.welcome);
    print(MessageConstants.inputNumbers);
    play();
  }

  void play() {
    try {
      String inputs = stdin.readLineSync() as String;

      final List<int> splittedNumbers = StringUtils.parseToList(inputs,
          converter: (input) => int.parse(input));

      print(splittedNumbers);

      bool isValid = InputValidator.validRange(splittedNumbers,
          (int num) => num >= GameRules.MIN_NUM && num <= GameRules.MAX_NUM);

      if (!isValid) throw Exception(ErrorMessageConstants.invalidRange);
    } catch (e) {
      print(e);
    }
  }
}
