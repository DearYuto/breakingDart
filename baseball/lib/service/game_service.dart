import 'package:baseball/model/game_result.dart';
import 'package:baseball/model/game_state.dart';

class GameService {
  GameService(this._gameState);

  final GameState _gameState;

  bool isNothing(String userInput) {
    for (int i = 0; i < userInput.length; i++) {
      if (!userInput.contains(_gameState.correctAnswer[i])) return true;
    }

    return false;
  }

  int calcStrike(List<int> userNumbers) {
    int strike = 0;

    for (int i = 0; i < userNumbers.length; i++) {
      if (int.tryParse(_gameState.correctAnswer[i]) == userNumbers[i]) {
        strike += 1;
      }
    }

    return strike;
  }

  int calcBall(List<int> userNumbers) {
    int ball = 0;
    final int strike = calcStrike(userNumbers);

    for (int i = 0; i < userNumbers.length; i++) {
      if (_gameState.correctAnswer.contains(userNumbers[i].toString())) {
        ball += 1;
      }
    }

    return ball - strike;
  }

  GameResult calcGameResult(List<int> userInput) {
    final int strike = calcStrike(userInput);
    final int ball = calcBall(userInput);

    // todo remove
    print('결과 디버깅용 ${_gameState.correctAnswer}');

    return GameResult(strike: strike, ball: ball);
  }
}
