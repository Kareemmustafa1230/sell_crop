import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_request.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_and_up_data_password_profile_response.dart';
import '../../../../core/error/api_error_handler.dart';

class CodeOtpDataSource {
  final ApiService _apiService;

  CodeOtpDataSource(this._apiService);

  // CodeOtp
  Future<CodeOtpAndUpDataPasswordProfileResponse> verifyOtp(CodeOtpRequest codeOtpRequest ) async {
    try {
      final response = await _apiService.verifyOtp(codeOtpRequest);
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
}
