import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/widgets/custom_listview.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:gym_management/widgets/fab.dart';
import 'package:gym_management/widgets/search_text_field.dart';
import 'package:provider/provider.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('All Members')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: SearchTextField(controller: _controller),
          ),
          provider.isSearching && provider.membersToShow.isEmpty
              ? Expanded(
                  child: Center(child: CustomText(text: "Member not found.")),
                )
              : provider.gymMembers.isEmpty
              ? Expanded(
                  child: Center(
                    child: CustomText(
                      text: """🏋️
              
No Members Yet
              
Tap + to add your first member.
              """,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Expanded(child: CustomListview()),
        ],
      ),
      floatingActionButton: Fab(),
    );
  }
}
