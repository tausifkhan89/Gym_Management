import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fs = 18,
    this.fw = 400,
    this.color,
  });

  final String text;
  final double? fs;
  final int fw;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fs, fontWeight: FontWeight(fw), color: color),
    );
  }
}
