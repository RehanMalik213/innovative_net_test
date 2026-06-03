import 'package:innovative_net_test/core/constants/app_api_constants.dart';
import 'package:innovative_net_test/core/network/network_api_service.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/entities/login_entity.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/request_params/login_request_params.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> login(LoginRequestParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkApiService _apiService;
  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<LoginEntity> login(LoginRequestParams params) async {
    final response = await _apiService.postRequest<LoginEntity>(
      path: AppApiConstants.login,
      body: params.toJson(),
      fromJson: (data) => LoginEntity.fromJson(data),
    );
    return response.fold((error) => throw error, (data) => data);
  }
}
