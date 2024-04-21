class InputValidator {
  InputValidator._();

  static bool validRange<T>(List<T> inputs, bool Function(T) conditionCb) {
    return inputs.every(conditionCb);
  }
}
