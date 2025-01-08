import 'package:flutter/material.dart';

class AppStyle {
  static get theme {
    return ThemeData(
      primarySwatch: Colors.purple,
      indicatorColor: Colors.purpleAccent,
      brightness: Brightness.light,
    );
  }

  static get darkTheme {
    return ThemeData(
      primarySwatch: Colors.purple,
      indicatorColor: Colors.purpleAccent,
      brightness: Brightness.dark,
    );
  }
}
