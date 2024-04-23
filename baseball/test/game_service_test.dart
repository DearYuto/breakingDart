import 'package:baseball/model/game_state.dart';
import 'package:baseball/service/game_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class MockGameState extends Mock implements GameState {}

void main() {
  group('GameService 클래스를 테스트할게요. 🐈', () {
    group('✅ isNothing 메서드 테스트', () {
      //TODO 테스트 코드 수정 후 서비스레이어에 구현하기
      late MockGameState mockGameState;
      late GameService gameService;
      String userInput = '123';

      setUp(() {
        mockGameState = MockGameState();
        gameService = GameService(mockGameState);
      });

      test('입력 값이 정답 값에 하나도 일치하지 않으면 true를 반환해요.', () {
        when(mockGameState.correctAnswer).thenReturn('456');

        expect(gameService.isNothing(userInput), isTrue);
      });
    });
  });
}
