import 'dart:io';

import 'package:calculator/view/output_view.dart';

void main() {
  OutputView.printStart();
  OutputView.printFirstNumberInput();

  // final double num1 = getUserInput();
  // final num2 = getUserInput();
}

// double getUserInput() {
//   String? input;

//   while (true) {
//     try {
//       input = readUserInput();
//       validateInput(input);
//       break;
//     } catch (err) {
//       print(err);
//       input = readUserInput();
//     }
//   }

//   return double.parse(input!);
// }
