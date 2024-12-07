import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/signup/data/model/sign_up_user_request.dart';
import 'package:sell_your_crop/features/signup/data/model/sign_up_user_response.dart';
import '../../../../core/error/api_error_handler.dart';

class SignUpDataSource {
  final ApiService _apiService;

  SignUpDataSource(this._apiService);

  // SignUp
  Future<SignUpUserResponse> signup(SignUpUserRequest signUpUserRequest) async {
    try {
      final response = await _apiService.signup(signUpUserRequest);
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}