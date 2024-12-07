import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/repo/up_data_new_password_profile_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/up_data_new_password_profile_state.dart';
import '../../data/model/request_model/up_data_password_request.dart';


class UpDataNewPasswordProfileCubit extends Cubit<UpDataNewPasswordProfileState> {
  final UpDataNewPasswordProfileRepo _upDataNewPasswordProfileRepo;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmationPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UpDataNewPasswordProfileCubit(this._upDataNewPasswordProfileRepo) : super(const UpDataNewPasswordProfileState.initial());

  Future<void> emitUpDataNwPasswordProfileState() async {
    emit(const UpDataNewPasswordProfileState.loading());
    final resendOtpResponse = await _upDataNewPasswordProfileRepo.updateNewPasswordProfile(
        UpDataPasswordRequest(
            password: newPasswordController.text,
            passwordConfirmation: confirmationPasswordController.text,
            oldPassword: oldPasswordController.text
      )
    );
    await resendOtpResponse.when(
      success: (response) async {
        emit(UpDataNewPasswordProfileState.success(message: response.msg!));
      },
      failure: (error) {
        emit(UpDataNewPasswordProfileState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}

