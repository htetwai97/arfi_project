// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemVOAdapter extends TypeAdapter<CartItemVO> {
  @override
  final int typeId = 2;

  @override
  CartItemVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemVO(
      itemTotalPrice: fields[0] as int?,
      price: fields[1] as int?,
      quantity: fields[2] as int?,
      unitId: fields[3] as int?,
      name: fields[5] as String?,
      color: fields[6] as String?,
      photo: fields[7] as String?,
      gender: fields[4] as String?,
      stock: fields[8] as int?,
      size: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.itemTotalPrice)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.unitId)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.photo)
      ..writeByte(8)
      ..write(obj.stock)
      ..writeByte(9)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
