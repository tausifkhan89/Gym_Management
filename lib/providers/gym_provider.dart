import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:uuid/uuid.dart';

class GymProvider extends ChangeNotifier {
  final List<GymMemberModel> _gymMembers = [];

  List<GymMemberModel> get gymMembers => UnmodifiableListView(_gymMembers);

  int get totalMembers => _gymMembers.length;

  List<GymMemberModel> get activeMembers => UnmodifiableListView(
    _gymMembers.where((member) {
      return member.isActive == true;
    }),
  ).toList();

  List<GymMemberModel> get expiredMembers => UnmodifiableListView(
    _gymMembers.where((member) {
      return member.isActive == false;
    }),
  ).toList();

  List<GymMemberModel> get expiringSoonMembers {
    final today = DateTime.now();

    return _gymMembers.where((member) {
      final difference = member.expiryDate.difference(today).inDays;

      return difference >= 0 && difference <= 3;
    }).toList();
  }

  final uuid = Uuid();

  void addMember(
    String name,
    String number,
    String? email,
    String membershipPlan,
    DateTime joinDate,
    DateTime expiryDate,
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
        expiryDate: expiryDate,
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
    DateTime joinDate,
    DateTime expiryDate,
  ) {
    _gymMembers[index] = GymMemberModel(
      id: iD,
      name: name,
      phone: number,
      membershipPlan: membershipPlan,
      joinDate: joinDate,
      expiryDate: expiryDate,
      isActive: true,
    );
    notifyListeners();
  }

  void deleteMember(GymMemberModel member) {
    _gymMembers.remove(member);

    notifyListeners();
  }
}
