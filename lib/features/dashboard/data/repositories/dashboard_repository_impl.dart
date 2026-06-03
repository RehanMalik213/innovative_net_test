import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';
import 'package:innovative_net_test/core/usecase/no_params.dart';
import 'package:innovative_net_test/features/dashboard/data/datasources/remote_datasource.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/distributer_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/route_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;

  DashboardRepositoryImpl(this.remote);

  @override
  Future<Either<APIError, DistributorEntity>> getDistributer({
    required NoParams params,
  }) async {
    try {
      final remoteData = await remote.getDistributer(params);
      return Right(remoteData);
    } on APIError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(APIError("Unexpected error"));
    }
  }

  @override
  Future<Either<APIError, RouteEntity>> getRoute({required int id}) async {
    try {
      final remoteData = await remote.getRoute(id: id);
      return Right(remoteData);
    } on APIError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(APIError("Unexpected error"));
    }
  }
}
