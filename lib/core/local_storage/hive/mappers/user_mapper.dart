import 'package:innovative_net_test/core/local_storage/hive/models/attendance/attendance_model.dart'
    as hive;
import 'package:innovative_net_test/core/local_storage/hive/models/tso/tso_model.dart'
    as hive;
import 'package:innovative_net_test/core/local_storage/hive/models/user/user_model.dart'
    as hive;
import 'package:innovative_net_test/features/Auth/Login/domain/entities/login_entity.dart'
    as domain;

extension UserMapper on domain.UserData {
  hive.UserData toHive() {
    return hive.UserData(
      id: id,
      name: name,
      email: email,
      city: city,
      emailVerifiedAt: emailVerifiedAt,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userType: userType,
      username: username,
      status: status,
      token: token,
      attendance: attendance.toHive(),
      tso: tso.toHive(),
    );
  }
}

extension AttendanceMapper on domain.UserAttendance {
  hive.UserAttendance toHive() {
    return hive.UserAttendance(
      id: id,
      userId: userId,
      attendanceIn: attendanceIn,
      attendanceOut: out,
      tsoId: tsoId,
      distributorId: distributorId,
      routeId: routeId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      latitudeIn: latitudeIn,
      longitudeIn: longitudeIn,
      latitudeOut: latitudeOut,
      longitudeOut: longitudeOut,
      date: date.toString(),
    );
  }
}

extension TsoMapper on domain.UserTso {
  hive.UserTso toHive() {
    return hive.UserTso(
      id: id,
      tsoCode: tsoCode,
      name: name,
      empId: empId,
      phone: phone,
      address: address,
      designation: hive.Designation(id: designation.id, name: designation.name),
      department: hive.Department(id: department.id, name: department.name),
      cities: hive.UserCities(id: cities.id, name: cities.name),
    );
  }
}
