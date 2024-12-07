import 'package:sell_your_crop/features/forget_password/data/model/number_phone_change_password_log_out_response.dart';
import 'package:sell_your_crop/features/setting/data/data_source/technical_support_data_source.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/technical_support_request.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class TechnicalSupportRepo {
  final TechnicalSupportDataSource _technicalSupportDataSource;

  TechnicalSupportRepo(this._technicalSupportDataSource);

  Future<ApiResult<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse>> technicalSupport(TechnicalSupportRequest technicalSupportRequest) async {
    try {
      final response = await _technicalSupportDataSource.technicalSupport(technicalSupportRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}