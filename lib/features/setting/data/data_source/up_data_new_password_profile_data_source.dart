import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_and_up_data_password_profile_response.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/up_data_password_request.dart';
import '../../../../core/error/api_error_handler.dart';

class UpDataNewPasswordProfileDataSource {
  final ApiService _apiService;

  UpDataNewPasswordProfileDataSource(this._apiService);

  // UpDataNewPasswordProfile
  Future<CodeOtpAndUpDataPasswordProfileResponse> updateNewPasswordProfile(UpDataPasswordRequest upDataPasswordRequest) async {
    try {
      final response = await _apiService.updateNewPasswordProfile(
          upDataPasswordRequest,
          'application/json',
          '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}'
      );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}