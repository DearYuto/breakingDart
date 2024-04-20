import 'package:baseball/utils/gen_random_number.dart';

String generateUniqueRandomNumbers({int count = 3, int min = 1, int max = 9}) {
  Set<int> uniqueNumbers = {};

  while (uniqueNumbers.length < count) {
    int randomNumber = generateRandomNumber(min, max);
    uniqueNumbers.add(randomNumber);
  }

  return uniqueNumbers.join();
}
