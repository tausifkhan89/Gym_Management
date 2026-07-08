import 'dart:collection';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gym_management/models/gym_member_model.dart';
import 'package:uuid/uuid.dart';

class GymProvider extends ChangeNotifier {
  GymProvider() {
    _memberBox = Hive.box<GymMemberModel>('members');
  }
  late final Box<GymMemberModel> _memberBox;

  List<GymMemberModel> get gymMembers =>
      _memberBox.values.toList().reversed.toList();

  int get totalMembers => gymMembers.length;

  List<GymMemberModel> get activeMembers => UnmodifiableListView(
    gymMembers.where((member) {
      return member.expiryDate.isAfter(DateTime.now());
    }),
  ).toList();

  List<GymMemberModel> get expiredMembers => UnmodifiableListView(
    gymMembers.where((member) {
      return member.expiryDate.isBefore(DateTime.now());
    }),
  ).toList();

  List<GymMemberModel> get expiringSoonMembers {
    final today = DateTime.now();

    return gymMembers.where((member) {
      final difference = member.expiryDate.difference(today).inDays;

      return difference >= 0 && difference <= 3;
    }).toList();
  }

  final uuid = Uuid();

  bool _isSearching = false;

  bool get isSearching => _isSearching;

  List<GymMemberModel> _filteredList = [];

  List<GymMemberModel> get membersToShow =>
      _isSearching ? _filteredList : gymMembers;

  void clearSearch() {
    _isSearching = false;
    _filteredList = [];
  }

  void search(String query) {
    if (query.trim().isEmpty) {
      _isSearching = false;
      _filteredList = [];
    } else {
      _isSearching = true;
      _filteredList = _memberBox.values.where((member) {
        return member.name.toLowerCase().contains(query.toLowerCase()) ||
            member.phone.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void addMember(
    String name,
    String number,
    String? email,
    String membershipPlan,
    DateTime joinDate,
    DateTime expiryDate,
  ) {
    _memberBox.add(
      GymMemberModel(
        id: uuid.v4(),
        name: name,
        phone: number,
        email: email,
        membershipPlan: membershipPlan,
        joinDate: joinDate,
        expiryDate: expiryDate,
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
    _memberBox.putAt(
      index,
      GymMemberModel(
        id: iD,
        name: name,
        phone: number,
        email: email,
        membershipPlan: membershipPlan,
        joinDate: joinDate,
        expiryDate: expiryDate,
      ),
    );
    notifyListeners();
  }

  Future<void> deleteMember(GymMemberModel member) async {
    await member.delete();

    notifyListeners();
  }
}
