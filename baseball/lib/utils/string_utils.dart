import 'package:baseball/constants/error_messages.dart';

class StringUtils {
  StringUtils._();

  // todo StringUtils 네이밍이 뭔가 애매해서 고민좀 해바야할듯,,

  static List<T> parseToList<T>(String str, {T Function(String)? converter}) {
    if (converter == null) {
      if (T == String) return str.split('').cast<T>().toList();

      throw ArgumentError(ErrorMessageConstants.invalidConvertType);
    }

    // todo 아래 로직 이동 시켜야 함
    final int? number = int.tryParse(str);
    if (number == null) throw ErrorMessageConstants.notANumber;

    return str.split('').map(converter).toList();
  }
}
