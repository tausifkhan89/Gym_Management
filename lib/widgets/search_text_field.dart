import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';

import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return TextField(
      controller: controller,
      onChanged: (value) {
        provider.search(value);
      },
      decoration: InputDecoration(
        hintText: 'Search Here',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.indigoAccent),
        ),
      ),
    );
  }
}
