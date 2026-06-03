import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/entities/login_entity.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/request_params/login_request_params.dart';

abstract class AuthRepository {
  Future<Either<APIError, LoginEntity>> login({
    required LoginRequestParams params,
  });
}
