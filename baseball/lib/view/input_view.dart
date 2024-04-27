import 'dart:io';

class InputView {
  String readInput() {
    return stdin.readLineSync() ?? '';
  }

  String readRegame() {
    print('게임 재시작은 1, 종료는 2를 눌러주세요.');

    return stdin.readLineSync() ?? '';
  }
}
