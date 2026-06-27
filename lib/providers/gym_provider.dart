import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:uuid/uuid.dart';

class GymProvider extends ChangeNotifier {
  final List<GymMemberModel> _gymMembers = [];

  List<GymMemberModel> get gymMembers => UnmodifiableListView(_gymMembers);

  int get totalMembers => _gymMembers.length;

  final uuid = Uuid();

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
        id: uuid.v4(),
        name: name,
        phone: number,
        email: email,
        membershipPlan: membershipPlan,
        joinDate: joinDate,
        expiryDate: joinDate,
        isActive: true,
      ),
    );

    notifyListeners();
  }

  void updateMember(
    int index,
    String iD,
    String name,
    String number,
    String? email,
    String membershipPlan,
    String joinDate,
  ) {
    _gymMembers[index] = GymMemberModel(
      id: iD,
      name: name,
      phone: number,
      membershipPlan: membershipPlan,
      joinDate: joinDate,
      expiryDate: joinDate,
      isActive: true,
    );
    notifyListeners();
  }

  void deleteMember(GymMemberModel member) {
    _gymMembers.remove(member);

    notifyListeners();
  }
}
