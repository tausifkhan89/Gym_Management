import 'package:flutter/material.dart';
import 'package:gym_management/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Settings Screen')),
      body: Switch(
        value: provider.isDark,
        onChanged: (value) {
          provider.toggleTheme();
        },
      ),
    );
  }
}
