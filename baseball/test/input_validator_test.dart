import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/validator/input_validator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('inputValidator 클래스를 테스트할게요. 🐈', () {
    final bool Function(int) callback =
        (int num) => num >= GameRules.minNum && num <= GameRules.maxNum;

    final testCases = [
      {
        'input': [1, 2, 3],
        'expected': true
      },
      {
        'input': [0, 0, 0],
        'expected': false,
      },
      {
        'input': [5, 1, 8],
        'expected': true,
      },
      {
        'input': [4, 10, 400],
        'expected': false,
      },
      {
        'input': [4, 5, -4],
        'expected': false,
      },
    ];

    for (var testCase in testCases) {
      test(
          '입력 받은 값: ${testCase['input']}, ${GameRules.minNum} ~ ${GameRules.maxNum} 사이의 숫자로 이루어져 있으면 ${testCase['expected']}를 반환해요.',
          () {
        expect(
            InputValidator.validRange(testCase['input'] as List<int>, callback),
            testCase['expected']);
      });
    }
  });
}
