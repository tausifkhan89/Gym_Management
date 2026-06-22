import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fs = 18,
    this.fw = 400,
  });

  final String text;
  final double? fs;
  final int fw;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fs, fontWeight: FontWeight(fw)),
    );
  }
}
