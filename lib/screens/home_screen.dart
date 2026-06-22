import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_management/providers/gym_provider.dart';
import 'package:gym_management/widgets/custom_container.dart';
import 'package:gym_management/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GymProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Gym Management')),
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
                  value: provider.totalMembers.toString(),
                  color: Colors.green,
                ),
              ],
            ),
            Row(
              children: [
                CustomContainer(
                  title: 'Expiring Soon',
                  value: provider.totalMembers.toString(),
                  color: Colors.yellow.shade800,
                ),

                CustomContainer(
                  title: 'Expired Members',
                  value: provider.totalMembers.toString(),
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),

            const CustomText(text: 'Recently Added Members', fs: 22, fw: 500),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: min(provider.gymMembers.length, 5),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.green.shade200,

                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person_outline),
                        ),
                        title: Text(provider.gymMembers[index].name),
                        subtitle: Text(provider.gymMembers[index].id),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.addMember();
        },
      ),
    );
  }
}
