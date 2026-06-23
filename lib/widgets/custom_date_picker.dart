import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  void dispose() {
    widget.dateController.dispose();
    super.dispose();
  }

  // 2. The Date Picker Logic
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        // Formats the date to mm/dd/yyyy manually without extra packages
        String month = pickedDate.month.toString().padLeft(2, '0');
        String day = pickedDate.day.toString().padLeft(2, '0');
        String year = pickedDate.year.toString();

        widget.dateController.text = "$day/$month/$year";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: 'Join Date ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight(500),
              fontSize: 14,
            ),
            children: [
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

            prefixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.black87,
            ),
            suffixIcon: const Icon(
              Icons.calendar_today,
              size: 20,
              color: Colors.black87,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.indigoAccent),
            ),
          ),
        ),
      ],
    );
  }
}
