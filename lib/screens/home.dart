import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/screens/add_member_screen.dart';
import 'package:gym_management/widgets/custom_container.dart';
import 'package:gym_management/widgets/custom_listview.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Gym Management')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                CustomContainer(
                  title: 'Total Members',
                  value: provider.totalMembers.toString(),
                  color: Colors.blue,
                ),

                CustomContainer(
                  title: 'Active Members',
                  value: provider.activeMembers.length.toString(),
                  color: Colors.green,
                ),
              ],
            ),
            Row(
              children: [
                CustomContainer(
                  title: 'Expiring Soon',
                  value: provider.expiringSoonMembers.length.toString(),
                  color: Colors.yellow.shade800,
                ),

                CustomContainer(
                  title: 'Expired Members',
                  value: provider.expiredMembers.length.toString(),
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),

            const CustomText(text: 'Recently Added Members', fs: 22, fw: 500),
            const SizedBox(height: 10),
            Expanded(
              child: provider.totalMembers == 0
                  ? Center(
                      child: CustomText(text: 'No recently added members.'),
                    )
                  : CustomListview(isLimited: true),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMemberScreen()),
          );
        },
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
