import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/forget_password/data/model/change_password_request.dart';
import 'package:sell_your_crop/features/forget_password/data/repo/change_password_repo.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepo _changePasswordRepo;

  ChangePasswordCubit(this._changePasswordRepo) : super(const ChangePasswordState.initial());
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

    Future<void> emitChangePasswordState() async {
      emit(const ChangePasswordState.loading());
      final resendOtpResponse = await _changePasswordRepo.changePassword(
        ChangePasswordRequest(
            password: passwordController.text,
            passwordConfirmation: confirmPasswordController.text,
        )
      );
      await resendOtpResponse.when(
        success: (response) async {
          emit(ChangePasswordState.success(message: response.msg!));
        },
        failure: (error) {
          emit(ChangePasswordState.error(error: error.apiErrorModel.msg));
        },
      );
    }
  }

