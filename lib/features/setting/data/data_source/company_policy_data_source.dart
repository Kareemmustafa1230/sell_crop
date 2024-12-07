import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/company_policy_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/constants/api_constants.dart';
import '../../../../core/networking/di/dependency_injection.dart';

class CompanyPolicyDataSource {
  final ApiService _apiService;

  CompanyPolicyDataSource(this._apiService);

  // CompanyPolicy
  Future<CompanyPolicyResponse> companyPolicy() async {
    try {
      final response = await _apiService.companyPolicy(
         '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}'
    );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}