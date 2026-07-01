import 'package:flutter/material.dart';
import 'package:gym_management/widgets/custom_text.dart';

class AddMemberTextField extends StatelessWidget {
  const AddMemberTextField({
    super.key,
    required this.text,
    required this.icon,
    required this.hintText,
    required this.textEditingController,
    this.isOptional = false,
    this.readOnly = false,
  });

  final String text;
  final IconData icon;
  final bool isOptional;
  final bool readOnly;
  final String hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(text: text, fs: 14, fw: 600),
            isOptional
                ? SizedBox.shrink()
                : CustomText(text: " *", color: Colors.red),
          ],
        ),
        TextField(
          controller: textEditingController,
          readOnly: readOnly,
          keyboardType: text == "Email ID"
              ? TextInputType.emailAddress
              : (text == "Phone Number"
                    ? TextInputType.numberWithOptions()
                    : TextInputType.name),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hint: CustomText(text: hintText, fs: 16, color: Colors.grey),
            prefixIcon: Icon(icon),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.indigoAccent),
            ),
          ),
          textCapitalization: TextCapitalization.sentences,
        ),
      ],
    );
  }
}
