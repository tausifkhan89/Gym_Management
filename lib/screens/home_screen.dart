import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/screens/home.dart';
import 'package:gym_management/screens/members_list.dart';
import 'package:gym_management/screens/settings_screen.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'GymPulse',
          fw: 600,
          fs: 24,
          color: Colors.indigoAccent,
        ),
      ),
      body: switch (myIndex) {
        0 => const Home(),
        1 => const MembersList(),
        _ => const SettingsScreen(),
      },

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        onTap: (index) {
          if (myIndex == 1) {
            context.read<GymProvider>().clearSearch();
          }
          setState(() {
            myIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined),
            label: 'Members',
            activeIcon: Icon(Icons.cases_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            activeIcon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
