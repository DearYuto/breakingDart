import 'package:calculator/validation/abstract_validator.dart';
import 'package:calculator/validation/validators/empty_validator.dart';
import 'package:calculator/validation/validators/input_validator.dart';
import 'package:calculator/validation/validators/number_format_validator.dart';
import 'package:calculator/view/input_view.dart';
import 'package:calculator/view/output_view.dart';

void main() {
  ValidationResult result;

  OutputView.printStart();
  OutputView.printFirstNumberInput();

  do {
    final String? firstInput = InputView.readUserInput();

    result = InputValidator([EmptyValidator(), NumberFormatValidator()])
        .validate(firstInput!);

    if (!result.isValid) {
      OutputView.printMessage(result.errorMessage);
    }
  } while (!result.isValid);

  // final num2 = getUserInput();
}
