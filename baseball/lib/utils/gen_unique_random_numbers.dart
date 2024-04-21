import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/utils/gen_random_number.dart';

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
