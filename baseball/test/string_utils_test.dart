import 'package:baseball/utils/string_utils.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('StringUtils 클래스를 테스트 할게요. 🐈', () {
    test('REASON 문자열을 넣으면 R,E,A,S,O,N 이 담긴 배열이 리턴된다.', () {
      final String input = 'REASON';
      final List<String> result = ['R', 'E', 'A', 'S', 'O', 'N'];

      expect(
          StringUtils.parseToList(
            input,
          ),
          result);
    });
  });
}
