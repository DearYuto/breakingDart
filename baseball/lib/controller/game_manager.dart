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

        _validateInput(parsedNumbers);

        isPlaying = false;
      } catch (e) {
        _outputView.printMessage(e.toString());
      }
    }
  }

  void _validateInput(List<int> inputs) {
    final bool Function(int) conditionCb =
        (int num) => num >= GameRules.minNum && num <= GameRules.maxNum;

    final Map<String, dynamic> validateInfo =
        InputValidator.validateAll(inputs, conditionCb: conditionCb);

    if (!validateInfo['valid']) throw Exception(validateInfo['reason']);
  }
}
