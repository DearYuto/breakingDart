import '../model/game_state.dart';

class GameService {
  final GameState _gameState;

  GameService(this._gameState);

  Map<String, dynamic> compareAnswer(String userInput) {
    int ball = 0;
    int strike = 0;

    for (int i = 0; i < userInput.length; i++) {
      if (this._gameState.correctAnswer[i] == userInput[i]) {
        strike += 1;
        continue;
      }

      if (this._gameState.correctAnswer.contains(userInput[i])) {
        ball += 1;
      }
    }

    return {
      'strike': strike,
      'ball': ball,
    };
  }
}
