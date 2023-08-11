import 'package:calculator/model/calculator.dart';
import 'package:calculator/view_model/calculator_viewmodel.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CsvStorageManager {
  static Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/calculator_data.csv');
    return file;
  }

  static Future<void> saveData(int first, int second, int result) async {
    final file = await _getFile();
    final csvFile = await file.exists() ? await file.readAsString() : '';

    List<List<dynamic>> rows = CsvToListConverter().convert(csvFile);
    rows ??= [];

    final newRow = [first, second, result];
    rows.add(newRow);

    final csvData = ListToCsvConverter().convert(rows);
    await file.writeAsString(csvData);
  }

  static Future<List<List<dynamic>>> loadData() async {
    final file = await _getFile();
    if (await file.exists()) {
      final csvData = await file.readAsString();
      List<List<dynamic>> rows = CsvToListConverter().convert(csvData);
      return rows;
    } else {
      return [];
    }
  }
}

/*class CalculatorViewDataManager {
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
}*/
