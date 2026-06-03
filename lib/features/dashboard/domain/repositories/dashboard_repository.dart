import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';
import 'package:innovative_net_test/core/usecase/no_params.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/distributer_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/route_entity.dart';

abstract class DashboardRepository {
  Future<Either<APIError, DistributorEntity>> getDistributer({
    required NoParams params,
  });
  Future<Either<APIError, RouteEntity>> getRoute({required int id});
}
