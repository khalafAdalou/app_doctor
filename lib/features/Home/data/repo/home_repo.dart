
import 'package:app_doctor/core/network/api_error_handler.dart';
import 'package:app_doctor/core/network/api_result.dart';
import 'package:app_doctor/features/Home/data/model/specializations_response_model.dart';

import '../apis/home_api_service.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationsResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
