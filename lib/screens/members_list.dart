import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/widgets/custom_listview.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('All Members')),
      body: provider.gymMembers.isEmpty
          ? Center(child: CustomText(text: "No Members"))
          : CustomListview(),
    );
  }
}
