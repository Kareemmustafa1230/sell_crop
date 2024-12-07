import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/get_profile_response.dart';
import '../../../../core/error/api_error_handler.dart';

class GetProfileDataSource {
  final ApiService _apiService;

  GetProfileDataSource(this._apiService);

  // GetProfile
  Future<GetProfileResponse> getProfile() async {
    try {
      final response = await _apiService.getProfile(
         'application/json'
    );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}