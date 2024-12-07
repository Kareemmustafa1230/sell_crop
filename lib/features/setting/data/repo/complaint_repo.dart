import 'package:sell_your_crop/features/forget_password/data/model/number_phone_change_password_log_out_response.dart';
import 'package:sell_your_crop/features/setting/data/data_source/complaint_data_source.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/complaint_request.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class ComplaintRepo {
  final ComplaintDataSource _complaintDataSource;

  ComplaintRepo(this._complaintDataSource);

  Future<ApiResult<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse>> complain(ComplaintRequest complaintRequest) async {
    try {
      final response = await _complaintDataSource.complain(complaintRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}