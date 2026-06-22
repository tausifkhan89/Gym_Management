import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GymProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gym Management",
      home: HomeScreen(),
    );
  }
}
