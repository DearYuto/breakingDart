import 'dart:io';

class InputView {
  String readInput() {
    return stdin.readLineSync() ?? '';
  }

  String readMessageInput(String message) {
    stdout.write('$message\n');
    return readInput();
  }
}
