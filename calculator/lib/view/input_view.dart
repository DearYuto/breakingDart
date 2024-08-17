import 'dart:io';

class InputView {
  static String? readUserInput() {
    return stdin.readLineSync();
  }
}
