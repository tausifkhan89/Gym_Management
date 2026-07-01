// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_member_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GymMemberModelAdapter extends TypeAdapter<GymMemberModel> {
  @override
  final int typeId = 0;

  @override
  GymMemberModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GymMemberModel(
      id: fields[0] as String,
      name: fields[1] as String,
      phone: fields[2] as String,
      email: fields[3] as String?,
      membershipPlan: fields[4] as String,
      joinDate: fields[5] as DateTime,
      expiryDate: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, GymMemberModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.membershipPlan)
      ..writeByte(5)
      ..write(obj.joinDate)
      ..writeByte(6)
      ..write(obj.expiryDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GymMemberModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
