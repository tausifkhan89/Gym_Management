import 'package:flutter/material.dart';

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
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),

        child: Container(
          margin: EdgeInsets.all(12),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: color, offset: Offset(-2, 3)),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(title, style: TextStyle(fontSize: 18)),
                Text(
                  value,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight(500)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
