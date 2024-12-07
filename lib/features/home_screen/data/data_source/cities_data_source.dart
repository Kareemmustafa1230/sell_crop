import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/home_screen/data/model/cities_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/constants/api_constants.dart';
import '../../../../core/networking/di/dependency_injection.dart';

class CitiesDataSource {
  final ApiService _apiService;

  CitiesDataSource(this._apiService);

  // Cities
  Future<CitiesResponse> cities() async {
    try {
      final response = await _apiService.cities(
         '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}'
    );
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}