import 'package:hive/hive.dart';

part 'gym_member_model.g.dart';

@HiveType(typeId: 0)
class GymMemberModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String membershipPlan;

  @HiveField(5)
  final DateTime joinDate;

  @HiveField(6)
  final DateTime expiryDate;

  GymMemberModel({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    required this.membershipPlan,
    required this.joinDate,
    required this.expiryDate,
  });
}
