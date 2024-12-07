import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/forget_password/data/model/number_phone_change_password_log_out_response.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/technical_support_request.dart';
import '../../../../core/error/api_error_handler.dart';

class TechnicalSupportDataSource {
  final ApiService _apiService;

  TechnicalSupportDataSource(this._apiService);

  // TechnicalSupport
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> technicalSupport(TechnicalSupportRequest technicalSupportRequest) async {
    try {
      final response = await _apiService.technicalSupport(
          technicalSupportRequest,
          '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}'
      );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}