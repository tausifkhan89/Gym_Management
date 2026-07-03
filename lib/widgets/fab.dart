import 'package:flutter/material.dart';
import 'package:gym_management/screens/add_member_screen.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddMemberScreen()),
        );
      },
      backgroundColor: Colors.indigoAccent,
      foregroundColor: Colors.white,
      child: Icon(Icons.add),
    );
  }
}
