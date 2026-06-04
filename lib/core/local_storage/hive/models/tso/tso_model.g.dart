// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tso_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTsoAdapter extends TypeAdapter<UserTso> {
  @override
  final int typeId = 2;

  @override
  UserTso read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTso(
      id: fields[0] as int,
      tsoCode: fields[1] as String,
      name: fields[2] as String,
      empId: fields[3] as String,
      phone: fields[4] as String,
      address: fields[5] as String,
      designation: fields[6] as Designation,
      department: fields[7] as Department,
      cities: fields[8] as UserCities,
    );
  }

  @override
  void write(BinaryWriter writer, UserTso obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.tsoCode)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.empId)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.designation)
      ..writeByte(7)
      ..write(obj.department)
      ..writeByte(8)
      ..write(obj.cities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTsoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DesignationAdapter extends TypeAdapter<Designation> {
  @override
  final int typeId = 3;

  @override
  Designation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Designation(id: fields[0] as int, name: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, Designation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DepartmentAdapter extends TypeAdapter<Department> {
  @override
  final int typeId = 4;

  @override
  Department read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Department(id: fields[0] as int, name: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, Department obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepartmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserCitiesAdapter extends TypeAdapter<UserCities> {
  @override
  final int typeId = 5;

  @override
  UserCities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCities(id: fields[0] as int, name: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, UserCities obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
