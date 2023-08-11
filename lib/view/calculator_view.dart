import 'package:calculator/model/datastorage.dart';
import 'package:calculator/view_model/calculator_viewmodel.dart';
import 'package:flutter/material.dart';

import '../model/calculator.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});
  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> with PrintResult {
  // late CalculatorView viewModel;
  late CalculatorViewDataManager dataManager;

  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  int _result = 0;

  /*@override
  void initState() {
    super.initState();
    viewModel = CalculatorView(
      calculator: CalculationModel(),
      result: this,
    );
}*/
  @override
  void initState() {
    super.initState();
    dataManager = CalculatorViewDataManager(
      calculator: CalculationModel(),
      result: this,
    );
    dataManager.loadSavedData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              height: 150,
              width: screenWidth,
              color: const Color.fromARGB(255, 85, 160, 213),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "RESULT ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Text(
                      '$_result',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Divider(
              color: Colors.blueGrey,
              indent: 5,
              endIndent: 5,
              thickness: 3,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: screenWidth * 0.6,
              child: TextFormField(
                  controller: _num1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number 1',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  }),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: screenWidth * 0.6,
              child: TextFormField(
                controller: _num2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number 2',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
                onPressed: () async {
                  int num1 = int.tryParse(_num1.text) ?? 0;
                  int num2 = int.tryParse(_num2.text) ?? 0;

                  /*  viewModel.firstDigit(num1);
                  viewModel.secondDigit(num2);
                  viewModel.addButtonPressed();*/
                  dataManager.addButtonPressed(num1, num2);
                },
                child: const Text("ADD NUMBERS")),
          ],
        ),
      ),
    );
  }

  @override
  void showResult(int x) {
    setState(() {
      _result = x; // Update the result variable
    });
  }
}
