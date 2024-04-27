import 'package:baseball/constants/messages.dart';
import 'package:baseball/model/game_result.dart';

class OutputView {
  void printWelcome() {
    print(MessageConstants.welcome);
  }

  void printInputNumbers() {
    print(MessageConstants.inputNumbers);
  }

  void printMessage(String message) {
    print(message);
  }

  void printCalcResult(GameResult gameResult) {
    printMessage(_getResultTemplate(gameResult));
  }

  void printGameOver() {
    printMessage(MessageConstants.gameover);
  }

  String _getResultTemplate(GameResult gameResult) {
    if (gameResult.ball == 0 && gameResult.strike == 0) {
      return MessageConstants.nothing;
    }

    if (gameResult.ball <= 0) {
      return '${gameResult.strike}${MessageConstants.strike}';
    }

    if (gameResult.strike <= 0) {
      return '${gameResult.ball}${MessageConstants.ball}';
    }

    return '${gameResult.ball}${MessageConstants.ball} ${gameResult.strike}${MessageConstants.strike}';
  }
}
