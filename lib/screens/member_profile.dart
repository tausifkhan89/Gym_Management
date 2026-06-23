import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:gym_management/widgets/container_text.dart';
import 'package:gym_management/widgets/custom_button.dart';
import 'package:gym_management/widgets/custom_text.dart';

class MemberProfile extends StatelessWidget {
  const MemberProfile({super.key, required this.member});

  final GymMemberModel member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Detail'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(radius: 70, child: Icon(Icons.person, size: 100)),
            CustomText(text: member.name, fs: 30, color: Colors.black, fw: 700),
            CustomText(text: "ID: #${member.id}", color: Colors.grey),
            const SizedBox(height: 18),
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
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 204, 211, 255),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.card_membership,
                            size: 40,
                            color: Colors.indigoAccent,
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomText(text: 'Membership', fw: 500, fs: 24),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Plan
                    ContainerText(text: 'Plan', data: member.membershipPlan),

                    // Joined
                    ContainerText(
                      text: "Joined",
                      data: member.joinDate.toString(),
                    ),

                    //Expires
                    ContainerText(
                      text: "Expires",
                      data: member.expiryDate.toString(),
                    ),

                    const SizedBox(height: 10),

                    CustomText(
                      text: "Extend Membership manually",
                      fs: 16,
                      color: Colors.grey.shade600,
                    ),

                    CustomButton(
                      text: 'Pay On Cash',
                      bGcolor: Colors.indigoAccent,
                      fGcolor: Colors.white,
                      icon: Icons.payments_outlined,
                      function: () {},
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
