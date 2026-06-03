import 'package:hive/hive.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/entities/login_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(LoginEntity user);
  LoginEntity? getUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<LoginEntity> _box;
  AuthLocalDataSourceImpl(this._box);

  @override
  Future<void> saveUser(LoginEntity user) async {
    await _box.put('cached_user', user);
  }

  @override
  LoginEntity? getUser() {
    return _box.get('cached_user');
  }
}
