import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/constants/messages.dart';
import 'package:baseball/model/game_state.dart';
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
  GameService _gameService;

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

        bool isStop = isGameOver(userNumbers);
        isPlaying = !isStop;
      } catch (e) {
        _outputView.printMessage(e.toString());
      }
    }
  }

  bool isGameOver(List<int> userNumbers) {
    GameResult result = _gameService.calcGameResult(userNumbers);

    if (result.strike == GameRules.gameOverCount) {
      _outputView.printGameOver();

      bool stop = false;
      while (!stop) {
        try {
          String reGameCommand = _inputView.readInput();
          stop = InputValidator.validReGameCommand(reGameCommand);

          if (reGameCommand == GameRules.regameCommand) _resetGame();

          if (reGameCommand == GameRules.exitCommand)
            _outputView.printMessage(MessageConstants.done);
        } catch (e) {
          throw e;
        }
      }

      return true;
    }

    _outputView.printCalcResult(result);

    return false;
  }

  void _resetGame() {
    this._gameService = GameService(GameState());
    initGame();
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
