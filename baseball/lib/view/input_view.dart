import 'dart:io';

class InputView {
  String readInput() {
    return stdin.readLineSync() ?? '';
  }
}
