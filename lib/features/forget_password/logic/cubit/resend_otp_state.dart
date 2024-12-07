import 'package:freezed_annotation/freezed_annotation.dart';
part 'resend_otp_state.freezed.dart';

@freezed
class ResendOtpState with _$ResendOtpState{
  const factory ResendOtpState.initial() = _Initial;
  const factory ResendOtpState.loading() = Loading;
  const factory ResendOtpState.success({required String message,required String data}) = Success;
  const factory ResendOtpState.error({required String error}) = Error;

}

