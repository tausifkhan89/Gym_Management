
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/screens/member_profile.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({super.key, this.isLimited = false});

  final bool isLimited;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: isLimited
          ? min(provider.totalMembers, 5)
          : provider.totalMembers,
      itemBuilder: (context, index) {
        final member = provider.gymMembers[index];

        return InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MemberProfile(member: member, index: index),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.indigo.shade100,
                        child: const Icon(
                          Icons.person,
                          color: Colors.indigo,
                          size: 30,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: member.name, fs: 20, fw: 600),

                            const SizedBox(height: 4),

                            Text(
                              "ID: ${member.id} • ${member.membershipPlan}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  _buildStatusChip(member),

                  const SizedBox(height: 18),

                  Text(
                    "Expiry Date",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    DateFormat('dd/MM/yyyy').format(member.joinDate),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(GymMemberModel member) {
    Color bgColor;
    Color borderColor;
    Color textColor;
    String text;

    final difference = member.expiryDate.difference(DateTime.now()).inDays;

    if (difference < 0) {
      bgColor = Colors.red.shade50;
      borderColor = Colors.red.shade300;
      textColor = Colors.red.shade700;
      text = "● Expired";
    } else if (difference <= 3) {
      bgColor = Colors.orange.shade50;
      borderColor = Colors.orange.shade300;
      textColor = Colors.orange.shade700;
      text = "● Expiring Soon";
    } else {
      bgColor = Colors.green.shade50;
      borderColor = Colors.green.shade300;
      textColor = Colors.green.shade700;
      text = "● Active";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
