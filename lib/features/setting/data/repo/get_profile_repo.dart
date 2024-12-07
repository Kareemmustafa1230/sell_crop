import 'package:sell_your_crop/features/setting/data/data_source/get_profile_data_source.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/get_profile_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class GetProfileRepo {
  final GetProfileDataSource _getProfileDataSource;

  GetProfileRepo(this._getProfileDataSource);

  Future<ApiResult<GetProfileResponse>> getProfile() async {
    try {
      final response = await _getProfileDataSource.getProfile();
      print('object4: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('object5: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}