import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/repo/get_profile_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/get_profile_state.dart';


class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileRepo _getProfileRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GetProfileCubit(this._getProfileRepo) : super(const GetProfileState.initial());

  void emitGetProfileStates() async {
    emit(const GetProfileState.loading());
    final response = await _getProfileRepo.getProfile();
    await response.when(
        success: (response) async{
      emit(GetProfileState.success(getProfileResponse: response));
      nameController.text = response.data?.name ?? '';
      phoneController.text = response.data?.mobile ?? '';
        }, failure: (error) {
      emit(GetProfileState.error(error: error.apiErrorModel.msg));
    });
  }
}

