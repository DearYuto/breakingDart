import 'dart:io';

import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/utils/string_utils.dart';
import 'package:baseball/validator/input_validator.dart';

import '../view/input_view.dart';
import '../view/output_view.dart';

class GameManager {
  final InputView _inputView;
  final OutputView _outputView;

  GameManager({required inputView, required outputView})
      : this._inputView = inputView,
        this._outputView = outputView {
    _outputView.printWelcome();
  }

  void initGame() {
    _outputView.printInputNumbers();
    play();
  }

  void play() {
    bool isPlaying = true;

    while (isPlaying) {
      try {
        String userInput = _inputView.readInput();
        final List<int> parsedNumbers =
            StringUtils.parseToList(userInput, converter: int.parse);

        isValidInput(parsedNumbers);

        print(parsedNumbers);
      } catch (e) {
        print(e);
      }
    }
  }

  bool isValidInput(List<int> inputs) {
    return InputValidator.validRange(inputs,
        (int num) => num >= GameRules.minNum && num <= GameRules.maxNum);

    // if (!isValid) throw Exception(ErrorMessageConstants.invalidRange);
  }
}
