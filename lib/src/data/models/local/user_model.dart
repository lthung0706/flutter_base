// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_ce/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? accessToken;
  @HiveField(3)
  final String? refreshToken;
  @HiveField(4)
  final int? expiresIn;
  @HiveField(5)
  final int? expiresAt;
  @HiveField(6)
  final String? phone;
  @HiveField(7)
  final String? deviceId;
  @HiveField(8)
  final String? ownerId;
  @HiveField(9)
  final String? role;
  @HiveField(10)
  final bool? isCreatedOrder;
  @HiveField(11)
  final String? nameRole;
  @HiveField(12)
  final List<CacheRole>? roles;
  @HiveField(13)
  final String? vehicleType;
  @HiveField(14)
  final String? name;

  User({
    this.id,
    this.email,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.expiresAt,
    this.phone,
    this.deviceId,
    this.ownerId,
    this.role,
    this.isCreatedOrder,
    this.nameRole,
    this.roles,
    this.vehicleType,
    this.name,
  });

  User copyWith({
    final String? id,
    final String? email,
    final String? accessToken,
    final String? refreshToken,
    final int? expiresIn,
    final int? expiresAt,
    final String? phone,
    final String? deviceId,
    final String? ownerId,
    final bool? isCreatedOrder,
    final String? nameRole,
    final List<CacheRole>? roles,
    final String? vehicleType,
    final String? name,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
      expiresAt: expiresAt ?? this.expiresAt,
      phone: phone ?? this.phone,
      deviceId: deviceId ?? this.deviceId,
      ownerId: ownerId ?? this.ownerId,
      isCreatedOrder: isCreatedOrder ?? this.isCreatedOrder,
      nameRole: nameRole ?? this.nameRole,
      roles: roles ?? this.roles,
      vehicleType: vehicleType ?? this.vehicleType,
    );
  }
}

@HiveType(typeId: 3)
class CacheRole {
  CacheRole({
    this.id,
    this.name,
    this.roleType,
    this.isDelete,
    this.isUpdate,
    this.isOrderCreated,
    this.createdAt,
    this.vehicleType,
    this.isCreate,
  });

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? roleType;

  @HiveField(3)
  final bool? isDelete;

  @HiveField(4)
  final bool? isUpdate;

  @HiveField(5)
  final bool? isOrderCreated;

  @HiveField(6)
  final String? createdAt;

  @HiveField(7)
  final String? vehicleType;

  @HiveField(8)
  final bool? isCreate;
}
