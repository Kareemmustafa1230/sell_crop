import 'package:sell_your_crop/features/setting/data/data_source/log_out_data_source.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';
import '../../../forget_password/data/model/number_phone_change_password_log_out_response.dart';

class LogOutRepo {
  final LogOutDataSource _logOutDataSource;

  LogOutRepo(this._logOutDataSource);

//LogOut
  Future<ApiResult<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse>> logout() async {
    try {
      final response = await _logOutDataSource.logout();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}