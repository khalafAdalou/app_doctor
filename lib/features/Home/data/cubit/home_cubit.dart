import 'package:app_doctor/core/helper/extensions.dart';
import 'package:app_doctor/core/network/api_error_handler.dart';
import 'package:app_doctor/core/network/api_result.dart';
import 'package:app_doctor/features/Home/data/model/specializations_response_model.dart';
import 'package:app_doctor/features/Home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getProfile() async {
    emit(const HomeState.profileLoading());

    final response = await _homeRepo.getProfile();

    response.when(
      success: (profileResponseModel) {
        print('PROFILE RESPONSE: ${profileResponseModel.usersList}');
        print('PROFILE NAME: ${profileResponseModel.usersList?.first?.name}');

        final userData =
        profileResponseModel.usersList?.isNotEmpty == true
            ? profileResponseModel.usersList!.first
            : null;

        print('USER DATA NAME: ${userData?.name}');

        emit(HomeState.profileSuccess(userData!));
      },
      failure: (errorHandler) {
        print('PROFILE ERROR: $errorHandler');
        emit(HomeState.profileError(errorHandler));
      },
    );
  }
  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        getDoctorsList(specializationId: specializationsList?.first?.id);

        emit(HomeState.specializationsSuccess(
            specializationsResponseModel.specializationDataList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
    getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}