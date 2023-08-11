import 'package:calculator/model/calculator.dart';
import 'package:calculator/model/datastorage.dart';

mixin PrintResult {
  void showResult(int x);
}

/*class CalculatorView {
  var first = 0;
  var second = 0;
  var addResult = 0;

  final CalculationModel calculator;
  final PrintResult result;

  CalculatorView({required this.calculator, required this.result}) {
    //data.loadData();
    /* first = data.dataList[0];
    second = data.dataList[1];
    addResult = data.dataList[2];*/
  }
  // final PrintResult updateResult;

  //CalculatorView({required this.calculator, required this.updateResult});

  /*void firstDigit(int x) {
    first = x;
  }

  void secondDigit(int x) {
    second = x;
  }

  void addButtonPressed() {
    addResult = calculator.add(first, second);
    result.showResult(addResult);
    print(addResult);
    // updateResult.showResult(addResult);
  }*/

  /* Future<void> dataCalculation() async {
    final saveData = [first, second, addResult];
    print("data calculation $data");
    data.logData(saveData);
  }*/
}*/
class CalculatorViewDataManager {
  final CalculationModel calculator;
  final PrintResult result;

  CalculatorViewDataManager({required this.calculator, required this.result});

  void addButtonPressed(int first, int second) {
    final addResult = calculator.add(first, second);
    result.showResult(addResult);
    CsvStorageManager.saveData(first, second, addResult);
  }

  Future<void> loadSavedData() async {
    final rows = await CsvStorageManager.loadData();
    if (rows.isNotEmpty) {
      final lastRow = rows.last;
      if (lastRow.length >= 3) {
        final first = lastRow[0] as int;
        final second = lastRow[1] as int;
        final addResult = lastRow[2] as int;
        result.showResult(addResult);
      }
    }
  }
}
