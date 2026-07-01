import 'package:flutter/material.dart';
import 'package:gym_management/theme/app_theme.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  late final Box _settingsBox;

  ThemeProvider() {
    _settingsBox = Hive.box('settings');

    _isDark = _settingsBox.get('isDark', defaultValue: false);
  }
  bool _isDark = false;

  ThemeData get theme => _isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    _settingsBox.put('isDark', _isDark);
    notifyListeners();
  }
}
