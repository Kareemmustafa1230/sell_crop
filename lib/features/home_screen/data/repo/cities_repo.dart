import 'package:sell_your_crop/features/home_screen/data/data_source/cities_data_source.dart';
import 'package:sell_your_crop/features/home_screen/data/model/cities_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class CitiesRepo {
  final CitiesDataSource _citiesDataSource;

  CitiesRepo(this._citiesDataSource);

  Future<ApiResult<CitiesResponse>> cities() async {
    try {
      final response = await _citiesDataSource.cities();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}