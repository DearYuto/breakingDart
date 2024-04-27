import '../constants/messages.dart';

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

  void printCalcResult({required int ball, required int strike}) {
    printMessage(_getResultTemplate(ball: ball, strike: strike));
  }

  void printGameOver() {
    printMessage(MessageConstants.gameover);
  }

  String _getResultTemplate({
    required int ball,
    required int strike,
  }) {
    if (ball == 0 && strike == 0) {
      return '${MessageConstants.nothing}';
    }

    if (ball <= 0) {
      return '${strike}${MessageConstants.strike}';
    }

    if (strike <= 0) {
      return '${ball}${MessageConstants.ball}';
    }

    return '${ball}${MessageConstants.ball} ${strike}${MessageConstants.strike}';
  }
}
