import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/validator/input_validator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('inputValidator 클래스를 테스트할게요. 🐈', () {
    group('✅ validRange 메서드 테스트', () {
      final bool Function(int) callback =
          (int num) => num >= GameRules.minNum && num <= GameRules.maxNum;

      //given
      const List<Map<String, dynamic>> testCases = [
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

      //when
      for (var testCase in testCases) {
        test(
            '입력 받은 값: ${testCase['input']}, ${GameRules.minNum} ~ ${GameRules.maxNum} 사이의 숫자로 이루어져 있으면 ${testCase['expected']}를 반환해요.',
            () {
          //then
          expect(
              InputValidator.validRange(
                  testCase['input'] as List<int>, callback),
              testCase['expected']);
        });
      }
    });

    group('✅ isUniqueList 메서드 테스트', () {
      const List<Map<String, dynamic>> testCases = [
        {
          'list': [1, 2, 3],
          'setList': [1, 2, 3],
          'expected': true,
        },
        {
          'list': [1, 1, 1],
          'setList': [1],
          'expected': false,
        },
        {
          'list': [1],
          'setList': [1],
          'expected': true,
        },
        {
          'list': [1, 2],
          'setList': [1, 2],
          'expected': true,
        }
      ];

      testCases.forEach((element) {
        test(
            'list: ${element['list']}, setList: ${element['setList']}, 중복 값을 제거했을 때 길이는 ${element['setList'].length}, 리턴 결과는 ${element['expected']}여야 해요.',
            () {
          expect(InputValidator.isUniqueList(element['list']),
              element['list'].length == element['setList'].length);
        });
      });
    });

    group('✅ validLength 메서드 테스트', () {
      const List<Map<String, dynamic>> testCases = [
        {
          'list': [1, 2, 3],
          'expected': true,
        },
        {
          'list': [1],
          'expected': false,
        },
        {
          'list': [],
          'expected': false,
        },
        {
          'list': [1, 2, 3, 4, 5, 6],
          'expected': false,
        },
      ];

      testCases.forEach((element) {
        test(
            '게임 룰로 정해진 길이: ${GameRules.answerLength}와 실제 인수로 들어온 List의 길이가 같은지 확인해요. 결과는: ${element['expected']}를 반환해요.',
            () {
          expect(
              InputValidator.validLength(element['list']), element['expected']);
        });
      });
    });
  });
}
