import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';

class MemberProfile extends StatelessWidget {
  const MemberProfile({super.key, required this.member});

  final GymMemberModel member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Member Detail')),
      body: Column(
        children: [Icon(Icons.person), Text(member.name), Text(member.id)],
      ),
    );
  }
}
