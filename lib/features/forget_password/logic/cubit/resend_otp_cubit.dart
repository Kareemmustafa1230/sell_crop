import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/forget_password/data/model/number_phone_request.dart';
import 'package:sell_your_crop/features/forget_password/data/repo/resend_otp_repo.dart';
import 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ResendOtpRepo _resendOtpRepo;

  ResendOtpCubit(this._resendOtpRepo) : super(const ResendOtpState.initial());
  TextEditingController mobileController = TextEditingController();
  final formKey = GlobalKey<FormState>();

    Future<void> emitResendOtpState() async {
      emit(const ResendOtpState.loading());
      final resendOtpResponse = await _resendOtpRepo.sendCodeToPhone(
        NumberPhoneRequest(
          mobile: mobileController.text,
        ),
      );
      await resendOtpResponse.when(
        success: (response) async {
          emit(ResendOtpState.success(message: response.msg!,data:response.data!));
        },
        failure: (error) {
          emit(ResendOtpState.error(error: error.apiErrorModel.msg));
        },
      );
    }
  }

