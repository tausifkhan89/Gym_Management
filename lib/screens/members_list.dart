import 'package:flutter/material.dart';
import 'package:gym_management/widgets/custom_listview.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Members')),
      body: Expanded(child: CustomListview()),
    );
  }
}
