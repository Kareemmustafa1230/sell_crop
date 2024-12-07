import 'package:sell_your_crop/features/setting/data/data_source/company_policy_data_source.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/company_policy_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class CompanyPolicyRepo {
  final CompanyPolicyDataSource _companyPolicyDataSource;

  CompanyPolicyRepo(this._companyPolicyDataSource);

  Future<ApiResult<CompanyPolicyResponse>> companyPolicy() async {
    try {
      final response = await _companyPolicyDataSource.companyPolicy();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}