import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';

abstract class UseCase<Type, Param> {
  Future<Either<APIError, Type>> call(Param params);
}
