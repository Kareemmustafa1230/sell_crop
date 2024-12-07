import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_request.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_and_selling_response.dart';
import '../../../../core/error/api_error_handler.dart';

class PurchaseStoreDataSource {
  final ApiService _apiService;

  PurchaseStoreDataSource(this._apiService);

  // purchaseStore
  Future<PurchaseAndSellingStoreResponse> purchaseStore(PurchaseStoreRequest purchaseStoreRequest ) async {
    try {
      final response = await _apiService.purchaseStore(purchaseStoreRequest);
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}