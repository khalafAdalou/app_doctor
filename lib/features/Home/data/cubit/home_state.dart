import 'package:app_doctor/core/network/api_error_handler.dart';
import 'package:app_doctor/features/Home/data/model/specializations_response_model.dart';
import 'package:app_doctor/features/profile/data/model/profile_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';



@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Specializations
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(List<SpecializationsData?>? specializationDataList) = SpecializationsSuccess;
  const factory HomeState.specializationsError(ErrorHandler errorHandler) =
  SpecializationsError;

  // Doctors
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess;
  const factory HomeState.doctorsError(ErrorHandler errorHandler) =
  DoctorsError;

  // profile
  const factory HomeState.profileLoading() = ProfileLoading;

  const factory HomeState.profileSuccess(UserData profileResponseModel,
      ) = ProfileSuccess;
  const factory HomeState.profileError(ErrorHandler errorHandler) =
  ProfileError;
}
