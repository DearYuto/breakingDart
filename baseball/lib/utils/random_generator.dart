import 'dart:math';
import 'package:baseball/constants/game_rules.dart';

class RandomGenerator {
  int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  String generateUniqueRandomNumbers(
      {int count = GameRules.matchCount,
      int min = GameRules.minNum,
      int max = GameRules.maxNum}) {
    Set<int> uniqueNumbers = {};

    while (uniqueNumbers.length < count) {
      int randomNumber = generateRandomNumber(min, max);
      uniqueNumbers.add(randomNumber);
    }

    return uniqueNumbers.join();
  }
}
