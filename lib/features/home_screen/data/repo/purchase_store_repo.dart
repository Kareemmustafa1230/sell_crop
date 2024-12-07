import 'package:sell_your_crop/features/home_screen/data/data_source/purchase_store_data_source.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_request.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_and_selling_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class PurchaseStoreRepo {
  final PurchaseStoreDataSource _purchaseStoreDataSource;

  PurchaseStoreRepo(this._purchaseStoreDataSource);

  Future<ApiResult<PurchaseAndSellingStoreResponse>> purchaseStore(PurchaseStoreRequest purchaseStoreRequest) async {
    try {
      final response = await _purchaseStoreDataSource.purchaseStore(purchaseStoreRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}