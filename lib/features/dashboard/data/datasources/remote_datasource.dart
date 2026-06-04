import 'package:innovative_net_test/core/constants/app_api_constants.dart';
import 'package:innovative_net_test/core/network/network_api_service.dart';
import 'package:innovative_net_test/core/usecase/no_params.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/checkin_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/distributer_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/route_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/request_params/check_in_request_params.dart';
import 'package:innovative_net_test/features/dashboard/domain/request_params/check_out_request_params.dart';

abstract class DashboardRemoteDataSource {
  Future<DistributorEntity> getDistributer(NoParams params);
  Future<RouteEntity> getRoute({required int id});
  Future<CheckinEntity> checkin(CheckInRequestParams params);
  Future<CheckinEntity> checkout(CheckOutRequestParams params);
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final NetworkApiService _apiService;
  DashboardRemoteDataSourceImpl(this._apiService);

  @override
  Future<DistributorEntity> getDistributer(NoParams params) async {
    final response = await _apiService.getRequest<DistributorEntity>(
      path: AppApiConstants.distributor,
      fromJson: (data) => DistributorEntity.fromJson(data),
    );
    return response.fold((error) => throw error, (data) => data);
  }

  @override
  Future<RouteEntity> getRoute({required int id}) async {
    final response = await _apiService.getRequest<RouteEntity>(
      path: "${AppApiConstants.routes}$id",
      fromJson: (data) => RouteEntity.fromJson(data),
    );
    return response.fold((error) => throw error, (data) => data);
  }

  @override
  Future<CheckinEntity> checkin(CheckInRequestParams params) async {
    final response = await _apiService.postRequest<CheckinEntity>(
      path: AppApiConstants.checkin,
      body: params.toJson(),
      fromJson: (data) => CheckinEntity.fromJson(data),
    );
    return response.fold((error) => throw error, (data) => data);
  }

  @override
  Future<CheckinEntity> checkout(CheckOutRequestParams params) async {
    final response = await _apiService.postRequest<CheckinEntity>(
      path: AppApiConstants.checkout,
      body: params.toJson(),
      fromJson: (data) => CheckinEntity.fromJson(data),
    );
    return response.fold((error) => throw error, (data) => data);
  }
}
