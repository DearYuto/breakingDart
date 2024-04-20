class InputValidator {
  InputValidator._();

  static bool validRange(String numbers) {
    final List<int> splittedNumbers =
        numbers.split('').map((number) => int.parse(number)).toList();

    return splittedNumbers.every((number) {
      return number >= 1 && number <= 9;
    });
  }
}
