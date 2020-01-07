import 'dart:async';

import 'package:digital_clock/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1),
        _updateTime,
      );
    });
  }

  Color _hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Color _getTimeInColor() {
    String hour = DateTime.now().hour.toString();
    String min = DateTime.now().minute.toString();
    String seconds = DateTime.now().second.toString();
    String color = '#FF$hour$min$seconds';
    print(color);
    return _hexToColor(color);
  }

  void _updateModel() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final second = DateFormat('ss').format(_dateTime);
    final fontSize = MediaQuery.of(context).size.width / 9;
    final backgroundColorHex = "#$hour$minute$second";
    final backgroundColor = _hexToColor(backgroundColorHex);

    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   "$hour:$minute",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 85.0,
              //       fontWeight: FontWeight.w700),
              // ),
              //SizedBox(height: 25.0),
              Text(
                backgroundColorHex,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
