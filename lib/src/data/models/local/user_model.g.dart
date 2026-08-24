// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      email: fields[1] as String?,
      accessToken: fields[2] as String?,
      refreshToken: fields[3] as String?,
      expiresIn: (fields[4] as num?)?.toInt(),
      expiresAt: (fields[5] as num?)?.toInt(),
      phone: fields[6] as String?,
      deviceId: fields[7] as String?,
      ownerId: fields[8] as String?,
      role: fields[9] as String?,
      isCreatedOrder: fields[10] as bool?,
      nameRole: fields[11] as String?,
      roles: (fields[12] as List?)?.cast<CacheRole>(),
      vehicleType: fields[13] as String?,
      name: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.accessToken)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.expiresIn)
      ..writeByte(5)
      ..write(obj.expiresAt)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.deviceId)
      ..writeByte(8)
      ..write(obj.ownerId)
      ..writeByte(9)
      ..write(obj.role)
      ..writeByte(10)
      ..write(obj.isCreatedOrder)
      ..writeByte(11)
      ..write(obj.nameRole)
      ..writeByte(12)
      ..write(obj.roles)
      ..writeByte(13)
      ..write(obj.vehicleType)
      ..writeByte(14)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CacheRoleAdapter extends TypeAdapter<CacheRole> {
  @override
  final typeId = 3;

  @override
  CacheRole read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheRole(
      id: fields[0] as String?,
      name: fields[1] as String?,
      roleType: fields[2] as String?,
      isDelete: fields[3] as bool?,
      isUpdate: fields[4] as bool?,
      isOrderCreated: fields[5] as bool?,
      createdAt: fields[6] as String?,
      vehicleType: fields[7] as String?,
      isCreate: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CacheRole obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.roleType)
      ..writeByte(3)
      ..write(obj.isDelete)
      ..writeByte(4)
      ..write(obj.isUpdate)
      ..writeByte(5)
      ..write(obj.isOrderCreated)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.vehicleType)
      ..writeByte(8)
      ..write(obj.isCreate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
