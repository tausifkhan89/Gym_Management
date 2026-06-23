import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/widgets/custom_button.dart';
import 'package:gym_management/widgets/custom_date_picker.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:gym_management/widgets/add_member_text_field.dart';
import 'package:provider/provider.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController membershipPlanController =
      TextEditingController();
  final TextEditingController joinDateController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    membershipPlanController.dispose();
    joinDateController.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Add New Member")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
            child: Column(
              children: [
                const CircleAvatar(
                  minRadius: 80,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                CustomText(text: 'Add Photo'),
                const SizedBox(height: 20),

                AddMemberTextField(
                  textEditingController: nameController,
                  text: 'Member Name',
                  hintText: 'John Doe',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 18),
                AddMemberTextField(
                  textEditingController: phoneController,
                  text: 'Phone Number',
                  icon: Icons.phone_outlined,
                  hintText: '+923 838 7435',
                ),
                const SizedBox(height: 18),
                AddMemberTextField(
                  textEditingController: emailController,
                  text: 'Email ID',
                  icon: Icons.email_outlined,
                  hintText: 'johnDoe@gmail.com',
                  isOptional: true,
                ),
                const SizedBox(height: 30),
                CustomText(text: 'Membership Details', fw: 600),
                const Divider(),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Membership Plan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight(500),
                      ),
                      children: [
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                DropdownMenu(
                  controller: membershipPlanController,
                  width: double.infinity,
                  hintText: "Select Membership",
                  leadingIcon: Icon(Icons.card_membership_rounded),
                  trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),

                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "1 month", label: '1 month'),
                    DropdownMenuEntry(value: "3 month", label: '3 month'),
                    DropdownMenuEntry(value: "6 month", label: '6 month'),
                    DropdownMenuEntry(value: "12 month", label: '12 month'),
                  ],
                ),
                const SizedBox(height: 18),

                CustomDatePicker(dateController: joinDateController),
                const SizedBox(height: 18),

                AddMemberTextField(
                  textEditingController: joinDateController,
                  text: 'Expiry Date',
                  icon: Icons.free_cancellation_outlined,
                  hintText: 'mm/dd/yyyy',
                  isOptional: true,
                ),
                const SizedBox(height: 18),

                Divider(),

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    CustomButton(
                      text: 'Cancel',
                      bGcolor: Colors.white,
                      fGcolor: Colors.indigoAccent,
                      function: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    CustomButton(
                      text: 'Save Member',
                      fGcolor: Colors.white,
                      bGcolor: Colors.indigoAccent,
                      icon: Icons.save_outlined,
                      function: () {
                        provider.addMember(
                          nameController.text,
                          phoneController.text,
                          emailController.text,
                          membershipPlanController.text,
                          joinDateController.text.toString(),
                        );

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
