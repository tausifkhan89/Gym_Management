import 'package:flutter/material.dart';
import 'package:gym_management/widgets/custom_listview.dart';
import 'package:gym_management/widgets/custom_text.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: 'All Members')),
      body: CustomListview(),
    );
  }
}
