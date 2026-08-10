

import 'package:app_doctor/core/network/ApiConstants.dart';
import 'package:app_doctor/features/Home/data/model/specializations_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'home_api_constants.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}