import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/widgets/custom_container.dart';
import 'package:gym_management/widgets/custom_listview.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:gym_management/widgets/fab.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: CustomText(
                        text:
                            "🏋️\nNo Recently Added Members Yet\nTap + to add your first member.",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : CustomListview(isLimited: true),
            ),
          ],
        ),
      ),
      floatingActionButton: Fab(),
    );
  }
}
