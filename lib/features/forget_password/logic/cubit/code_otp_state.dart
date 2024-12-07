import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_and_up_data_password_profile_response.dart';
part 'code_otp_state.freezed.dart';

@freezed
 class CodeOtpState with _$CodeOtpState {
  const factory CodeOtpState.initial() = _Initial;
  const factory CodeOtpState.loading() = Loading;
  const factory CodeOtpState.success({required String message, required CodeOtpAndUpDataPasswordProfileResponse codeOtpResponse}) = Success;
  const factory CodeOtpState.error({required String error}) = Error;
}
