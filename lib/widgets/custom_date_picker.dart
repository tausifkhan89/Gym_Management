import 'package:flutter/material.dart';
import 'package:gym_management/providers/theme_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        widget.dateController.text = DateFormat(
          'dd/MM/yyyy',
        ).format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Join Date ',
            style: TextStyle(
              fontWeight: const FontWeight(500),
              fontSize: 14,
              color: themeProvider.isDark ? Colors.white : Colors.black,
            ),
            children: const [
              TextSpan(
                text: '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        TextFormField(
          controller: widget.dateController,
          readOnly: true,
          onTap: _selectDate,
          decoration: InputDecoration(
            hintText: 'dd-mm-yyyy',
            hintStyle: const TextStyle(color: Colors.grey),

            prefixIcon: const Icon(Icons.calendar_today_outlined),
            suffixIcon: const Icon(Icons.calendar_today, size: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: themeProvider.isDark ? Colors.white60 : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
