import 'package:app_doctor/core/network/api_error_handler.dart';
import 'package:app_doctor/core/network/api_result.dart';
import 'package:app_doctor/core/network/api_service.dart';
import 'package:app_doctor/features/Login/data/model/login_request_body.dart';
import 'package:app_doctor/features/Login/data/model/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
