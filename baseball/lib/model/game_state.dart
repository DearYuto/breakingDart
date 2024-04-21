import 'package:baseball/utils/gen_unique_random_numbers.dart';

class GameState {
  final String _answer;

  GameState() : _answer = generateUniqueRandomNumbers(count: 3) {}
}
