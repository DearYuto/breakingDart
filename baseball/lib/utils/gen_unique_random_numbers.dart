import 'package:baseball/constants/game_rules.dart';
import 'package:baseball/utils/gen_random_number.dart';

String generateUniqueRandomNumbers(
    {int count = GameRules.MATCH_COUNT,
    int min = GameRules.MIN_NUM,
    int max = GameRules.MAX_NUM}) {
  Set<int> uniqueNumbers = {};

  while (uniqueNumbers.length < count) {
    int randomNumber = generateRandomNumber(min, max);
    uniqueNumbers.add(randomNumber);
  }

  return uniqueNumbers.join();
}
