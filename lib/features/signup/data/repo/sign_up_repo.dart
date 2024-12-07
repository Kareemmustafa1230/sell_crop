import 'package:sell_your_crop/features/signup/data/data_source/sign_up_data_source.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';
import '../model/sign_up_user_request.dart';
import '../model/sign_up_user_response.dart';

class SignUpRepo {
  final SignUpDataSource _signUpDataSource;

  SignUpRepo(this._signUpDataSource);

  Future<ApiResult<SignUpUserResponse>> signup(
      SignUpUserRequest signUpUserRequest) async {
    try {
      final response = await _signUpDataSource.signup(signUpUserRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}