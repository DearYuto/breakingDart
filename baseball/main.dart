import 'dart:io';

import 'package:baseball/constants/messages.dart';
import 'package:baseball/utils/gen_random_number.dart';
import 'package:baseball/utils/gen_unique_random_numbers.dart';

void main() {
  print(MessageConstants.welcome);
  print(MessageConstants.inputNumbers);

  String numbers = stdin.readLineSync();
  print(generateUniqueRandomNumbers());
}
