class ValidatonError extends Error {
  final String message;

  ValidatonError(this.message);

  @override
  String toString() {
    return "ValidatonError: $message";
  }
}
