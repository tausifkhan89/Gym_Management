import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';

class GymProvider extends ChangeNotifier {
  final List<GymMemberModel> _gymMembers = [];

  int _id = 1;

  List<GymMemberModel> get gymMembers => UnmodifiableListView(_gymMembers);

  int get totalMembers => _gymMembers.length;

  void addMember() {
    _gymMembers.insert(
      0,
      GymMemberModel(
        id: _id.toString(),
        name: "Tausif",
        phone: "349875983745",
        membershipPlan: "1 Month",
        joinDate: DateTime.now(),
        expiryDate: DateTime.now(),
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
