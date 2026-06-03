import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';
import 'package:innovative_net_test/core/usecase/no_params.dart';
import 'package:innovative_net_test/core/usecase/use_case.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/distributer_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardUsecase extends UseCase<DistributorEntity, NoParams> {
  final DashboardRepository repository;
  DashboardUsecase(this.repository);

  @override
  Future<Either<APIError, DistributorEntity>> call(NoParams params) =>
      repository.getDistributer(params: params);
}
