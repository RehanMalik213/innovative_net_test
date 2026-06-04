// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAttendanceAdapter extends TypeAdapter<UserAttendance> {
  @override
  final int typeId = 1;

  @override
  UserAttendance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAttendance(
      id: fields[0] as int,
      userId: fields[1] as int,
      attendanceIn: fields[2] as DateTime?,
      attendanceOut: fields[3] as DateTime?,
      tsoId: fields[4] as int,
      distributorId: fields[5] as int,
      routeId: fields[6] as int,
      createdAt: fields[7] as DateTime?,
      updatedAt: fields[8] as DateTime?,
      latitudeIn: fields[9] as String?,
      longitudeIn: fields[10] as String?,
      latitudeOut: fields[11] as String?,
      longitudeOut: fields[12] as String?,
      date: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserAttendance obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.attendanceIn)
      ..writeByte(3)
      ..write(obj.attendanceOut)
      ..writeByte(4)
      ..write(obj.tsoId)
      ..writeByte(5)
      ..write(obj.distributorId)
      ..writeByte(6)
      ..write(obj.routeId)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.latitudeIn)
      ..writeByte(10)
      ..write(obj.longitudeIn)
      ..writeByte(11)
      ..write(obj.latitudeOut)
      ..writeByte(12)
      ..write(obj.longitudeOut)
      ..writeByte(13)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAttendanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
