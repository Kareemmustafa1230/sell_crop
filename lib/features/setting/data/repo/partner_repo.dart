import 'package:sell_your_crop/features/setting/data/data_source/partner_data_source.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/partner_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class PartnerRepo {
  final PartnerDataSource _partnerDataSource;

  PartnerRepo(this._partnerDataSource);

  Future<ApiResult<PartnerResponse>> partners() async {
    try {
      final response = await _partnerDataSource.partners();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}