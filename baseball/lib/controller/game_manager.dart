import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/utils/string_utils.dart';
import 'package:baseball/validator/input_validator.dart';
import 'package:baseball/validator/validation_result.dart';

import '../model/game_result.dart';
import '../service/game_service.dart';
import '../view/input_view.dart';
import '../view/output_view.dart';

class GameManager {
  final InputView _inputView;
  final OutputView _outputView;
  final GameService _gameService;

  GameManager(
      {required inputView,
      required outputView,
      required GameService gameService})
      : this._inputView = inputView,
        this._outputView = outputView,
        this._gameService = gameService {
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
        List<int> userNumbers = _getUserInput();
        _validateInput(userNumbers);
        isPlaying = false;

        matchNumbers(userNumbers);
      } catch (e) {
        _outputView.printMessage(e.toString());
      }
    }
  }

  matchNumbers(List<int> userNumbers) {
    GameResult result = _gameService.calcGameResult(userNumbers);
    print('${result.ball} ${result.strike} ${result.nothing}');
  }

  List<int> _getUserInput() {
    String userInput = _inputView.readInput();
    final List<int> parsedNumbers =
        StringUtils.parseToList(userInput, converter: int.parse);

    return parsedNumbers;
  }

  void _validateInput(List<int> inputs) {
    final bool Function(int) conditionCb =
        (int num) => num >= GameRules.minNum && num <= GameRules.maxNum;

    final ValidationResult validateInfo =
        InputValidator.validateAll(inputs, conditionCb: conditionCb);

    if (!validateInfo.valid) throw Exception(validateInfo.reason);
  }
}
