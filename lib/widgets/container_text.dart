import 'package:flutter/material.dart';
import 'package:gym_management/widgets/custom_text.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({super.key, required this.text, required this.data});

  final String text;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: text, color: Colors.grey.shade600),
              CustomText(text: data, fw: 600),
            ],
          ),
          Divider(color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
