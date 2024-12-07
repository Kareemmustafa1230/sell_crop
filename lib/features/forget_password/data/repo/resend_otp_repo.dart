import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';
import '../data_source/resend_otp_data_source.dart';
import '../model/number_phone_request.dart';
import '../model/number_phone_change_password_log_out_response.dart';

class ResendOtpRepo {
  final ResendOtpDataSource _resendOtpDataSource;

  ResendOtpRepo(this._resendOtpDataSource);

//ResendOtp
  Future<ApiResult<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse>> sendCodeToPhone(
      NumberPhoneRequest numberPhoneRequest) async {
    try {
      final response = await _resendOtpDataSource.sendCodeToPhone(numberPhoneRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}