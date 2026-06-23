import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';

class GymProvider extends ChangeNotifier {
  final List<GymMemberModel> _gymMembers = [];

  int _id = 1;

  List<GymMemberModel> get gymMembers => UnmodifiableListView(_gymMembers);

  int get totalMembers => _gymMembers.length;

  void addMember(
    String name,
    String number,
    String? email,
    String membershipPlan,
    String joinDate,
  ) {
    _gymMembers.insert(
      0,
      GymMemberModel(
        id: _id.toString(),
        name: name,
        phone: number,
        membershipPlan: membershipPlan,
        joinDate: joinDate,
        expiryDate: joinDate,
        isActive: true,
      ),
    );
    _id++;

    notifyListeners();
  }

  void deleteMember(GymMemberModel member) {
    _gymMembers.remove(member);

    notifyListeners();
  }
}
