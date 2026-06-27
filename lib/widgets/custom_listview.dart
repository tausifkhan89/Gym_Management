import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/screens/member_profile.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({super.key, this.isLimited = false});

  final bool isLimited;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return Container(
      height: double.minPositive,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(width: 0.5, color: Colors.indigoAccent),
      ),
      child: ListView.builder(
        itemCount: isLimited
            ? min(provider.totalMembers, 5)
            : provider.totalMembers,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberProfile(
                    member: provider.gymMembers[index],
                    index: index,
                  ),
                ),
              );
            },
            child: ListTile(
              tileColor: Colors.white,
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person_outline, color: Colors.white),
              ),
              title: CustomText(
                text: provider.gymMembers[index].name,
                fs: 20,
                fw: 500,
              ),
              subtitle: Text(provider.gymMembers[index].phone),
              trailing: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4,
                  ),
                  child: CustomText(
                    text: provider.gymMembers[index].membershipPlan,
                    fs: 12,
                    fw: 600,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
