import 'package:sell_your_crop/features/forget_password/data/data_source/change_password_data_source.dart';
import 'package:sell_your_crop/features/forget_password/data/model/change_password_request.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';
import '../model/number_phone_change_password_log_out_response.dart';

class ChangePasswordRepo {
  final ChangePasswordDataSource _changePasswordDataSource;

  ChangePasswordRepo(this._changePasswordDataSource);

//ChangePassword
  Future<ApiResult<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse>> changePassword(ChangePasswordRequest changePasswordRequest) async {
    try {
      final response = await _changePasswordDataSource.changePassword(changePasswordRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}