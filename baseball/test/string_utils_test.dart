import 'package:baseball/utils/string_utils.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StringUtils 클래스를 테스트 할게요. 🐈', () {
    test('REASON 문자열을 넣으면 R,E,A,S,O,N 이 담긴 배열이 리턴된다.', () {
      const String input = 'REASON';
      const List<String> result = ['R', 'E', 'A', 'S', 'O', 'N'];

      expect(
          StringUtils.parseToList<String>(
            input,
          ),
          result);
    });

    test('문자열 123, converter 함수로 숫자를 변환하는 함수를 인자로 넣으면 숫자 1,2,3이 담긴 배열이 리턴된다.',
        () {
      const String input = '123';
      const List<int> result = [1, 2, 3];

      expect(
          StringUtils.parseToList(
            input,
            converter: (String str) => int.parse(str),
          ),
          result);
    });
  });
}
