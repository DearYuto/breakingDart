import 'dart:io';

void main() {
  print('계산기 프로그램을 실행합니다.');
  print('연산할 첫 번째 숫자를 입력해주세요.');

  final double num1 = getUserInput();
  // final num2 = getUserInput();
}

void validateInput(String? userInput) {
  if (userInput == null || userInput.isEmpty) {
    throw Exception('잘못된 입력값입니다.');
  }

  if (double.tryParse(userInput) == null) {
    throw Exception('빈 값은 입력할 수 없습니다.');
  }
}

String? readUserInput() {
  return stdin.readLineSync();
}

double getUserInput() {
  String? input;

  while (true) {
    try {
      input = readUserInput();
      validateInput(input);
      break;
    } catch (err) {
      print(err);
      input = readUserInput();
    }
  }

  return double.parse(input!);
}
