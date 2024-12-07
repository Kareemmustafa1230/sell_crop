import 'package:sell_your_crop/core/networking/api/api_service.dart';
import '../../../../core/error/api_error_handler.dart';
import '../model/number_phone_request.dart';
import '../model/number_phone_change_password_log_out_response.dart';

class ResendOtpDataSource {
  final ApiService _apiService;

  ResendOtpDataSource(this._apiService);

  // SendCodeToPhone
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> sendCodeToPhone(NumberPhoneRequest numberPhoneRequest ) async {
    try {
      final response = await _apiService.sendCodeToPhone(numberPhoneRequest);
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
  }
