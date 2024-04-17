import 'dart:io';

import 'package:baseball/constants/messages.dart';

void main() {
  print(MessageConstants.welcome);

  print('3자리 숫자를 입력해주세요.');
  String numbers = stdin.readLineSync();

  print('$numbers');
}
