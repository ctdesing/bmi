import 'package:flutter/material.dart';
import 'input_page.dart';
import 'i_palette.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: IPalette.fadedBlue,
        scaffoldBackgroundColor: IPalette.dark,
      ),
      home: InputPage(),
    );
  }
}
