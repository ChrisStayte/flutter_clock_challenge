import 'package:digital_clock/customizer.dart';
import 'package:digital_clock/model.dart';
import 'package:digital_clock/screens/digital_clock_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Digital Clock",
      debugShowCheckedModeBanner: false,
      home: (ClockCustomizer((ClockModel model) => DigitalClock(model))),
    );
  }
}
