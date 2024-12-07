import 'package:sell_your_crop/features/home_screen/data/data_source/selling_store_data_source.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_and_selling_response.dart';
import 'package:sell_your_crop/features/home_screen/data/model/selling_store_request.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class SellingStoreRepo {
  final SellingStoreDataSource _sellingStoreDataSource;

  SellingStoreRepo(this._sellingStoreDataSource);

  Future<ApiResult<PurchaseAndSellingStoreResponse>> sellingStore(SellingStoreRequest sellingStoreRequest) async {
    try {
      final response = await _sellingStoreDataSource.sellingStore(sellingStoreRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}