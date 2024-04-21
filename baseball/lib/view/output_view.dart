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
}
