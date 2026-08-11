

import 'package:app_doctor/core/network/ApiConstants.dart';
import 'package:app_doctor/features/profile/data/model/profile_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'profile_api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET(ApiConstants.profile)
  Future<UsersResponseModel> getProfile();
}