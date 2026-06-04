import 'package:fpdart/fpdart.dart';
import 'package:innovative_net_test/core/network/api_error.dart';
import 'package:innovative_net_test/core/usecase/no_params.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/checkin_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/distributer_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/route_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/request_params/check_in_request_params.dart';
import 'package:innovative_net_test/features/dashboard/domain/request_params/check_out_request_params.dart';

abstract class DashboardRepository {
  Future<Either<APIError, DistributorEntity>> getDistributer({
    required NoParams params,
  });
  Future<Either<APIError, RouteEntity>> getRoute({required int id});
  Future<Either<APIError, CheckinEntity>> syncCheckinData({
    required CheckInRequestParams params,
  });
  Future<Either<APIError, CheckinEntity>> checkout({
    required CheckOutRequestParams params,
  });
}
