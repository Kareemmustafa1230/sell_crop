import 'package:sell_your_crop/features/forget_password/data/data_source/code_otp_data_source.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_request.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_and_up_data_password_profile_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class CodeOtpRepo {
  final CodeOtpDataSource _codeOtpDataSource;

  CodeOtpRepo(this._codeOtpDataSource);

//CodeOtp
  Future<ApiResult<CodeOtpAndUpDataPasswordProfileResponse>> verifyOtp(
      CodeOtpRequest codeOtpRequest) async {
    try {
      final response = await _codeOtpDataSource.verifyOtp(codeOtpRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}