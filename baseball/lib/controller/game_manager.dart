import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/constants/messages.dart';
import 'package:baseball/model/game_result.dart';
import 'package:baseball/model/game_state.dart';
import 'package:baseball/service/game_service.dart';
import 'package:baseball/utils/string_utils.dart';
import 'package:baseball/validator/input_validator.dart';
import 'package:baseball/validator/validation_result.dart';
import 'package:baseball/view/input_view.dart';
import 'package:baseball/view/output_view.dart';

class GameManager {
  GameManager({
    required InputView inputView,
    required OutputView outputView,
    required GameService gameService,
  })  : _inputView = inputView,
        _outputView = outputView,
        _gameService = gameService {
    _outputView.printWelcome();
  }

  final InputView _inputView;
  final OutputView _outputView;
  GameService _gameService;

  void initGame() {
    _outputView.printInputNumbers();
    play();
  }

  void play() {
    bool isPlaying = true;
    while (isPlaying) {
      try {
        final List<int> userNumbers = _getUserInput();
        _validateInput(userNumbers);

        final bool isStop = isGameOver(userNumbers);
        isPlaying = !isStop;
      } catch (e) {
        _outputView.printMessage(e.toString());
      }
    }
  }

  bool isGameOver(List<int> userNumbers) {
    final GameResult result = _gameService.calcGameResult(userNumbers);

    if (result.strike == GameRules.gameOverCount) {
      _outputView.printGameOver();

      bool stop = false;
      while (!stop) {
        try {
          final String reGameCommand = _inputView.readInput();
          stop = InputValidator.validReGameCommand(reGameCommand);

          if (reGameCommand == GameRules.regameCommand) _resetGame();

          if (reGameCommand == GameRules.exitCommand) {
            _outputView.printMessage(MessageConstants.done);
          }
        } catch (e) {
          rethrow;
        }
      }

      return true;
    }

    _outputView.printCalcResult(result);

    return false;
  }

  void _resetGame() {
    _gameService = GameService(GameState());
    initGame();
  }

  List<int> _getUserInput() {
    final String userInput = _inputView.readInput();
    final List<int> parsedNumbers =
        StringUtils.parseToList(userInput, converter: int.parse);

    return parsedNumbers;
  }

  void _validateInput(List<int> inputs) {
    bool conditionCb(int num) =>
        num >= GameRules.minNum && num <= GameRules.maxNum;

    final ValidationResult validateInfo =
        InputValidator.validateAll(inputs, conditionCb: conditionCb);

    if (!validateInfo.valid) throw Exception(validateInfo.reason);
  }
}
