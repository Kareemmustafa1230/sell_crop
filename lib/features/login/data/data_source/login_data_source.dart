import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/login/data/model/login_request_body.dart';
import 'package:sell_your_crop/features/login/data/model/login_user_response.dart';
import '../../../../core/error/api_error_handler.dart';

class LoginDataSource {
  final ApiService _apiService;

  LoginDataSource(this._apiService);

  // Login
  Future<LoginUserResponse> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
  }
