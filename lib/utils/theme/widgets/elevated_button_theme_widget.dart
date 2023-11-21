import 'package:flutter/material.dart';

class ElevatedThemeWidget {
  ElevatedThemeWidget._();
  static final List<ElevatedButtonThemeData> _elevatedBtns = [
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: Colors.transparent,
      ),
    ),
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shadowColor: Colors.transparent,
      ),
    ),
  ];
  //getter
  static ElevatedButtonThemeData get light => _elevatedBtns.first;
  static ElevatedButtonThemeData get dark => _elevatedBtns.last;
}
