import 'package:flutter/material.dart';
import 'package:gym_management/providers/theme_provider.dart';
import 'package:gym_management/widgets/custom_text.dart';
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
      body: SwitchListTile(
        title: CustomText(text: "Dark Mode"),
        value: provider.isDark,
        onChanged: (value) {
          provider.toggleTheme();
        },
      ),
    );
  }
}
