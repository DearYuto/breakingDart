class StringUtils {
  StringUtils._();

  static List<T> parseToList<T>(String str, {T Function(String)? converter}) {
    converter ??= (s) => s as T;

    return str.split('').map((char) => converter!(char)).toList();
  }
}
