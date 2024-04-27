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

  void printCalcResult(
      {required int ball, required int strike, required bool nothing}) {
    if (nothing) {
      print('낫싱');
      return;
    }

    if (ball <= 0) {
      print('${strike}스트라이크');
      return;
    }

    if (strike <= 0) {
      print('${ball}볼');
      return;
    }

    print('${ball}볼 ${strike}스트라이크');
  }

  void printGameOver() {
    print('🎉🎉 3스트라이크! 🎉🎉');
  }
}
