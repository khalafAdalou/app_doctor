import 'package:app_doctor/core/network/api_result.dart';
import 'package:app_doctor/features/Home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());

    final response = await _homeRepo.getSpecialization();

    response.when(
      success: (specializationsResponseModel) {
        emit(
          HomeState.specializationsSuccess(
            specializationsResponseModel,
          ),
        );
      },
      failure: (errorHandler) {
        emit(
          HomeState.specializationsError(
            errorHandler,
          ),
        );
      },
    );
  }
}