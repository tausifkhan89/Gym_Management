import 'package:flutter/material.dart';
import 'package:gym_management/screens/home.dart';
import 'package:gym_management/widgets/custom_button.dart';
import 'package:gym_management/widgets/custom_text.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key, required this.no, required this.yes});

  final VoidCallback no;
  final VoidCallback yes;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(text: "Delete", fs: 24, fw: 500),
      backgroundColor: const Color.fromARGB(255, 219, 232, 255),

      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            CustomText(text: "Do you really wanted to remove the user?"),
            Row(
              mainAxisAlignment: .center,
              children: [
                CustomButton(
                  text: "No",
                  bGcolor: Colors.green,
                  fGcolor: Colors.white,
                  function: () {
                    no();
                  },
                ),
                CustomButton(
                  text: "Yes",
                  bGcolor: Colors.redAccent,
                  fGcolor: Colors.white,
                  function: () {
                    yes();
                    Navigator.popUntil(context, (route) => route.isFirst);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
