import 'package:app_doctor/core/network/api_error_handler.dart';
import 'package:app_doctor/core/network/api_result.dart';
import 'package:app_doctor/core/network/api_service.dart';
import 'package:app_doctor/features/SignUp/data/model/sign_up_request_body.dart';
import 'package:app_doctor/features/SignUp/data/model/sign_up_response.dart';

class Signuprepo {
  final ApiService _apiService;

  Signuprepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}