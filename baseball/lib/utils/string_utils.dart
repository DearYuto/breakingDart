import 'package:baseball/constants/error_messages.dart';

class StringUtils {
  StringUtils._();

  static List<T> parseToList<T>(String str, {T Function(String)? converter}) {
    if (converter == null) {
      if (T == String) return str.split('').cast<T>().toList();

      throw ArgumentError(ErrorMessageConstants.invalidConvertType);
    }

    final int? number = int.tryParse(str);
    if (number == null) throw ErrorMessageConstants.notANumber;

    return str.split('').map(converter).toList();
  }
}
