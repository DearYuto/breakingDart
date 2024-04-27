import 'package:baseball/utils/random_generator.dart';

class GameState {
  GameState()
      : _correctAnswer = RandomGenerator().generateUniqueRandomNumbers();

  final String _correctAnswer;

  String get correctAnswer => _correctAnswer;
}
