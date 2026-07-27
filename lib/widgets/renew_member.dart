import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/widgets/container_text.dart';
import 'package:gym_management/widgets/custom_button.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:gym_management/widgets/membership_plan_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RenewMember extends StatefulWidget {
  const RenewMember({super.key, required this.index, required this.member});

  final int index;

  final GymMemberModel member;

  @override
  State<RenewMember> createState() => _RenewMemberState();
}

class _RenewMemberState extends State<RenewMember> {
  @override
  void initState() {
    super.initState();
    membershipPlanController.addListener(_calculateExpiryDate);
  }

  void _calculateExpiryDate() {
    try {
      int months = int.parse(membershipPlanController.text.split(' ')[0]);
      DateTime expiryDate = DateTime(
        widget.member.expiryDate.year,
        widget.member.expiryDate.month + months,
        widget.member.expiryDate.day,
      );
      setState(() {
        expiryDateController.text = DateFormat('dd-MM-yyyy').format(expiryDate);
      });
    } catch (e) {
      expiryDateController.text = '';
    }
  }

  final TextEditingController membershipPlanController =
      TextEditingController();

  final TextEditingController expiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Renew Membership")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(width: 1, color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    const SizedBox(width: 10),
                    const CustomText(
                      text: 'Current Membership',
                      fw: 600,
                      fs: 22,
                    ),
                    const SizedBox(height: 20),
                    // Plan
                    ContainerText(
                      text: 'Current Plan',
                      data: widget.member.membershipPlan,
                    ),

                    // Joined
                    ContainerText(
                      text: "Joined",
                      data: DateFormat(
                        "dd-MM-yyyy",
                      ).format(widget.member.joinDate),
                    ),

                    //Expires
                    ContainerText(
                      text: "Expires",
                      data: DateFormat(
                        "dd-MM-yyyy",
                      ).format(widget.member.expiryDate),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(width: 1, color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    const SizedBox(width: 10),
                    const CustomText(
                      text: 'Extended Membership',
                      fw: 600,
                      fs: 22,
                    ),
                    const SizedBox(height: 20),
                    // Plan
                    MembershipPlanDropdown(
                      membershipPlanController: membershipPlanController,
                    ),

                    const SizedBox(height: 20),

                    //Expires
                    ContainerText(
                      text: "New Expiry",
                      data: expiryDateController.text.isEmpty
                          ? "-"
                          : expiryDateController.text,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          text: 'Save',
                          fGcolor: Colors.white,
                          bGcolor: Colors.indigoAccent,
                          icon: Icons.save_outlined,
                          function: () {
                            DateTime date = DateFormat(
                              'dd-MM-yyyy',
                            ).parse(expiryDateController.text);
                            context.read<GymProvider>().extendMembership(
                              widget.index,
                              date,
                            );
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
