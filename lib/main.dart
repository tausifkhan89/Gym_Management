import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/providers/theme_provider.dart';

import 'package:gym_management/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GymMemberModelAdapter());

  await Hive.openBox<GymMemberModel>('members');
  await Hive.openBox('settings');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GymProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, child) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gym Management",
      theme: provider.theme,

      home: HomeScreen(),
    );
  }
}
