import 'package:sell_your_crop/features/forget_password/data/model/code_otp_and_up_data_password_profile_response.dart';
import 'package:sell_your_crop/features/setting/data/data_source/up_data_new_password_profile_data_source.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/up_data_password_request.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class UpDataNewPasswordProfileRepo {
  final UpDataNewPasswordProfileDataSource _upDataNewPasswordProfileDataSource;

  UpDataNewPasswordProfileRepo(this._upDataNewPasswordProfileDataSource);

  Future<ApiResult<CodeOtpAndUpDataPasswordProfileResponse>> updateNewPasswordProfile(UpDataPasswordRequest upDataPasswordRequest) async {
    try {
      final response = await _upDataNewPasswordProfileDataSource.updateNewPasswordProfile(upDataPasswordRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}