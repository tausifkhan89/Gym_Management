class GymMemberModel {
  final String name;
  final String id;
  final String phone;
  final String? email;
  final String membershipPlan;
  final String joinDate;
  final String expiryDate;
  final bool isActive;

  GymMemberModel({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    required this.membershipPlan,
    required this.joinDate,
    required this.expiryDate,
    required this.isActive,
  });
}
