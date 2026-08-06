import 'package:app_doctor/core/network/api_service.dart';
import 'package:app_doctor/core/network/dio_factory.dart';
import 'package:app_doctor/features/Login/data/cubit/login_cubit.dart';
import 'package:app_doctor/features/Login/data/repo/loginRepo.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio
  final Dio dio = DioFactory.getDio();

  // ApiService: نفس النسخة طوال التطبيق
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio),);
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}