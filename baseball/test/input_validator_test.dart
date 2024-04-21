import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/validator/input_validator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('inputValidator 클래스를 테스트할게요. 🐈', () {
    final bool Function(int) callback =
        (int num) => num >= GameRules.MIN_NUM && num <= GameRules.MAX_NUM;

    test(
        '입력 받은 값이 ${GameRules.MIN_NUM} ~ ${GameRules.MAX_NUM} 사이의 숫자로 이루어져 있으면 true를 반환해요.',
        () {
      const List<int> inputs = [1, 2, 3];

      expect(InputValidator.validRange(inputs, callback), isTrue);
    });

    test(
        '입력 값이 ${GameRules.MIN_NUM} ~ ${GameRules.MAX_NUM} 사이가 아니면 false를 반환해요.',
        () {
      const List<int> inputs = [0, 0, 0];

      expect(InputValidator.validRange(inputs, callback), isFalse);
    });
  });
}
