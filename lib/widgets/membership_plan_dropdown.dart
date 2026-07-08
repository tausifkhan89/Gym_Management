import 'package:flutter/material.dart';

class MembershipPlanDropdown extends StatelessWidget {
  const MembershipPlanDropdown({super.key, required this.membershipPlanController});

  final TextEditingController membershipPlanController;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
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
                );
  }
}