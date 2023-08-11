import 'package:calculator/view/calculator_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 9, 7, 9)),
        useMaterial3: true,
      ),
      home: const CalculatorPage(
        title: 'C A L C U L A T O R',
      ),
    );
  }
}
