import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.bGcolor,
    required this.fGcolor,
    this.icon,
    required this.function,
  });

  final String text;
  final Color? bGcolor;
  final Color? fGcolor;
  final IconData? icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          foregroundColor: fGcolor,
          backgroundColor: bGcolor,
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[Icon(icon), const SizedBox(width: 8)],
            Text(text),
          ],
        ),
      ),
    );
  }
}
