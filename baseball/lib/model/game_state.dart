import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/utils/gen_unique_random_numbers.dart';

class GameState {
  final String _correctAnswer;

  GameState()
      : _correctAnswer =
            generateUniqueRandomNumbers(count: GameRules.matchCount) {}

  // todo. 중간에 서비스 클래스를 만들어서 입력 값과 비교 시키기
  String get correctAnswer => _correctAnswer;
}
