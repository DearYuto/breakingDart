import 'dart:io';

import 'package:baseball/constants/messages.dart';
import 'package:baseball/utils/gen_unique_random_numbers.dart';
import 'package:baseball/validator/input_validator.dart';

void main() {
  print(MessageConstants.welcome);
  print(MessageConstants.inputNumbers);

  try {
    String numbers = stdin.readLineSync() as String;
    InputValidator.validRange(numbers);
  } catch (e) {
    print(e);
  }

  // 입력 값 예외 처리 후 재입력 받기

  print(generateUniqueRandomNumbers());
}
