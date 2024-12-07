import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_request.dart';
import 'package:sell_your_crop/features/forget_password/data/repo/code_otp_repo.dart';
import 'code_otp_state.dart';


class CodeOtpCubit extends Cubit<CodeOtpState> {
  final CodeOtpRepo _codeOtpRepo;

  CodeOtpCubit(this._codeOtpRepo) : super(const CodeOtpState.initial());
  TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitResendOtpState() async {
    emit(const CodeOtpState.loading());
    final resendOtpResponse = await _codeOtpRepo.verifyOtp(
      CodeOtpRequest(
        mobile:"${getIt<SharedPrefHelper>().getData(key: ApiKey.phone)}",
        otp:otpController.text,
      ),
    );
    await resendOtpResponse.when(
      success: (response) async {
        emit(CodeOtpState.success(message: response.msg!,codeOtpResponse:response));
      },
      failure: (error) {
        emit(CodeOtpState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}

