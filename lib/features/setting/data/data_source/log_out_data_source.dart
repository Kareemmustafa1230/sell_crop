import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../forget_password/data/model/number_phone_change_password_log_out_response.dart';

class  LogOutDataSource{
  final ApiService _apiService;

  LogOutDataSource(this._apiService);

  // LogOutDataSource
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> logout() async {
    try {
      final response = await _apiService.logout(
          'Bearer ${getIt<SharedPrefHelper>().getData(key: ApiKey.authorization)}',
          'application/json'
      );
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
  }
