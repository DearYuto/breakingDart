import 'package:baseball/model/game_result.dart';

import '../model/game_state.dart';

class GameService {
  final GameState _gameState;

  GameService(this._gameState);

  bool isNothing(String userInput) {
    for (int i = 0; i < userInput.length; i++) {
      if (!userInput.contains(_gameState.correctAnswer[i])) return true;
    }

    return false;
  }

  int calcStrike(List<int> userNumbers) {
    int strike = 0;

    for (int i = 0; i < userNumbers.length; i++) {
      if (this._gameState.correctAnswer[i] == userNumbers[i]) {
        strike += 1;
      }
    }

    return strike;
  }

  int calcBall(List<int> userNumbers) {
    int ball = 0;
    int strike = calcStrike(userNumbers);

    for (int i = 0; i < userNumbers.length; i++) {
      if (this._gameState.correctAnswer.contains(userNumbers[i].toString())) {
        ball += 1;
      }
    }

    return ball - strike;
  }

  GameResult calcGameResult(List<int> userInput) {
    int strike = calcStrike(userInput);
    int ball = calcBall(userInput);
    bool nothing = ball == 0 && strike == 0;

    return GameResult(strike: strike, ball: ball, nothing: nothing);
  }
}
