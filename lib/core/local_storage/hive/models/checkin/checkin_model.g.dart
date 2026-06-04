// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfflineCheckInAdapter extends TypeAdapter<OfflineCheckIn> {
  @override
  final int typeId = 6;

  @override
  OfflineCheckIn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineCheckIn(
      uuid: fields[0] as String?,
      checkin: fields[1] as String,
      userId: fields[2] as int,
      latitude: fields[3] as String,
      longitude: fields[4] as String,
      distributorId: fields[5] as int,
      routeId: fields[6] as int,
      distributorName: fields[7] as String,
      routeName: fields[8] as String,
      userName: fields[9] as String,
      isSynced: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OfflineCheckIn obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.checkin)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.distributorId)
      ..writeByte(6)
      ..write(obj.routeId)
      ..writeByte(7)
      ..write(obj.distributorName)
      ..writeByte(8)
      ..write(obj.routeName)
      ..writeByte(9)
      ..write(obj.userName)
      ..writeByte(10)
      ..write(obj.isSynced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfflineCheckInAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
