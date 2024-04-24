import 'package:baseball/utils/random_generator.dart';

class GameState {
  final String _correctAnswer;

  GameState()
      : _correctAnswer = RandomGenerator().generateUniqueRandomNumbers();

  String get correctAnswer => _correctAnswer;
}
