import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/cities_repo.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/cities_state.dart';


class CitiesCubit extends Cubit<CitiesState> {
  final CitiesRepo _citiesRepo;

  CitiesCubit(this._citiesRepo) : super(const CitiesState.initial());

  void emitCitiesStates() async {
    emit(const CitiesState.loading());
    final response = await _citiesRepo.cities();
    await response.when(
        success: (response) async{
      emit(CitiesState.success(citiesResponse: response));
    }, failure: (error) {
      emit(CitiesState.error(error: error.apiErrorModel.msg));
    });
  }
}

