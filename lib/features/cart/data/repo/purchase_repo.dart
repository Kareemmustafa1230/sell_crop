import 'package:sell_your_crop/features/search/data/model/search_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';
import '../data_source/purchase_data_source.dart';

class PurchaseRepo {
  final PurchaseDataSource _purchaseDataSource;

  PurchaseRepo(this._purchaseDataSource);

//Purchase
  Future<ApiResult<SearchResponse>> purchase( ) async {
    try {
      final response = await _purchaseDataSource.purchase();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
