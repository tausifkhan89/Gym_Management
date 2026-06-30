import 'package:flutter/material.dart';
import 'package:gym_management/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  ThemeData get theme => _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
