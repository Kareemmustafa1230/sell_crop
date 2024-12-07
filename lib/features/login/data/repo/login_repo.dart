import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';
import '../data_source/login_data_source.dart';
import '../model/login_request_body.dart';
import '../model/login_user_response.dart';

class LoginRepo {
  final LoginDataSource _loginDataSource;

  LoginRepo(this._loginDataSource);

//login
  Future<ApiResult<LoginUserResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _loginDataSource.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}