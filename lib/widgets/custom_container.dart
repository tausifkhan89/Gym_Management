import 'package:flutter/material.dart';
import 'package:gym_management/providers/theme_provider.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),

        child: Container(
          margin: EdgeInsets.all(12),
          height: 100,
          decoration: BoxDecoration(
            color: themeProvider.isDark ? Colors.white24 : Colors.white70,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: color, offset: Offset(-2, 3)),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                CustomText(text: title, fs: 18, color: Colors.black),
                CustomText(text: value, fs: 22, fw: 500, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
