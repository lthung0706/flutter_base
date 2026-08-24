// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_purchase_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PendingPurchaseCacheAdapter extends TypeAdapter<PendingPurchaseCache> {
  @override
  final typeId = 4;

  @override
  PendingPurchaseCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PendingPurchaseCache(
      purchaseId: fields[0] as String?,
      productId: fields[1] as String,
      transactionDate: fields[2] as String?,
      status: fields[3] as String,
      purchaseToken: fields[4] as String,
      verificationSource: fields[5] as String,
      pendingCompletePurchase: fields[6] as bool,
      description: fields[7] as String,
      price: fields[8] as String,
      title: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PendingPurchaseCache obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.purchaseId)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.transactionDate)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.purchaseToken)
      ..writeByte(5)
      ..write(obj.verificationSource)
      ..writeByte(6)
      ..write(obj.pendingCompletePurchase)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PendingPurchaseCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
