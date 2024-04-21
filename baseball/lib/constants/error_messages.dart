import 'package:baseball/constants/game_rules.dart';

class ErrorMessageConstants {
  ErrorMessageConstants._();

  static const String invalidConvertType =
      '반환 타입이 문자열 리스트가 아닌 경우 converter 콜백 함수를 넣어주세요.';

  static const String invalidRange =
      '${GameRules.minNum} ~ ${GameRules.maxNum} 사이의 숫자만 입력할 수 있어요.';
}
