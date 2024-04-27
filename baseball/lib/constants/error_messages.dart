import 'package:baseball/constants/game_rules.dart';

class ErrorMessageConstants {
  ErrorMessageConstants._();

  static const String _retryPrefix = '[ERROR]';
  static const String _retrySuffix = '다시 입력해주세요.';

  static const String invalidConvertType =
      '$_retryPrefix 반환 타입이 문자열 리스트가 아닌 경우 converter 콜백 함수를 넣어주세요.';
  static const String invalidRange =
      '$_retryPrefix ${GameRules.minNum} ~ ${GameRules.maxNum} 사이의 숫자만 입력할 수 있어요. $_retrySuffix';
  static const String invalidLength =
      '$_retryPrefix 입력한 값의 길이는 반드시 ${GameRules.answerLength}이어야 해요. $_retrySuffix';
  static const String invalidUnique =
      '$_retryPrefix 입력한 값에 중복된 숫자가 포함되어 있어요. $_retrySuffix';
  static const String emptyInput =
      '$_retryPrefix 빈 값은 입력할 수 없어요. $_retrySuffix';
  static const String notANumber = '$_retryPrefix 숫자만 입력할 수 있어요. $_retrySuffix';
}
