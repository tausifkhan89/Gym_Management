import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({super.key, this.isLimited = false});

  final bool isLimited;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return ListView.builder(
      itemCount: isLimited
          ? min(provider.totalMembers, 5)
          : provider.totalMembers,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,

                  offset: Offset(-2, 3),
                  color: Colors.black12,
                ),
              ],
            ),
            child: ListTile(
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
          ),
        );
      },
    );
  }
}
