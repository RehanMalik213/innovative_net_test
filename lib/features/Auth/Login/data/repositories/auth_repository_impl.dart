import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';
import 'package:innovative_net_test/features/Auth/Login/data/datasources/remote_datasource.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/entities/login_entity.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/repositories/auth_repository.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/request_params/login_request_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<APIError, LoginEntity>> login({
    required LoginRequestParams params,
  }) async {
    try {
      final remoteData = await remote.login(params);
      return Right(remoteData);
    } on APIError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(APIError("Unexpected error"));
    }
  }
}
