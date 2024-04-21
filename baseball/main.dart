import 'package:baseball/controller/game_manager.dart';
import 'package:baseball/view/input_view.dart';
import 'package:baseball/view/output_view.dart';

void main() {
  GameManager gameManager = GameManager(
    inputView: InputView(),
    outputView: OutputView(),
  );

  gameManager.initGame();
}
