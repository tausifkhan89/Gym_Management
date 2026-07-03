import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fs = 18,
    this.fw = 400,
    this.color,
    this.textAlign,
  });

  final String text;
  final double? fs;
  final int fw;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: fs, fontWeight: FontWeight(fw), color: color),
    );
  }
}
