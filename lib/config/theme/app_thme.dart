import 'package:flutter/material.dart';

const Color _customcolor = Color(0xFF441D82);

const List<Color> _colorThemes = [
  _customcolor,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
];

class AppThme {
  final int selectColor;

  AppThme({this.selectColor = 0})
    : assert(
        selectColor >= 0 && selectColor <= _colorThemes.length - 1,
        'colors must be between 0 and ${_colorThemes.length - 1}',
      );
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectColor],
    );
  }
}
