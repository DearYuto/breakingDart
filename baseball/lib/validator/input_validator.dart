class InputValidator {
  InputValidator._();

  // todo validator 인터페이스 만들기
  static bool validRange(String numbers) {
    try {
      final List<int> splittedNumbers =
          numbers.split('').map((number) => int.parse(number));

      return splittedNumbers.every((number) {
        return number >= 3 && number <= 9;
      });
    } catch (e) {
      throw Error();
    }
  }
}
