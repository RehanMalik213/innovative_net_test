import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';
import 'package:innovative_net_test/core/usecase/use_case.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/entities/login_entity.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/repositories/auth_repository.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/request_params/login_request_params.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginRequestParams> {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<Either<APIError, LoginEntity>> call(LoginRequestParams params) =>
      repository.login(params: params);
}
