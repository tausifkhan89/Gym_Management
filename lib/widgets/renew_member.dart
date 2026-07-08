import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:gym_management/widgets/membership_plan_dropdown.dart';

class RenewMember extends StatelessWidget {
  RenewMember({super.key, required this.member});

  final GymMemberModel member;
  final TextEditingController membershipPlanController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Renew Membership")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                CustomText(text: "Name"),
                CustomText(text: member.name),
              ],
            ),
            MembershipPlanDropdown(
              membershipPlanController: membershipPlanController,
            ),
          ],
        ),
      ),
    );
  }
}
