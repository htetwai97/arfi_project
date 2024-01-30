// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataVOAdapter extends TypeAdapter<UserDataVO> {
  @override
  final int typeId = 1;

  @override
  UserDataVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      deliveredAddress: fields[4] as String?,
      username: fields[5] as String?,
      password: fields[6] as String?,
      photo: fields[7] as String?,
      registeredDate: fields[8] as String?,
      authToken: fields[9] as String?,
      isAlwaysLogin: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataVO obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.deliveredAddress)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.photo)
      ..writeByte(8)
      ..write(obj.registeredDate)
      ..writeByte(9)
      ..write(obj.authToken)
      ..writeByte(10)
      ..write(obj.isAlwaysLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
