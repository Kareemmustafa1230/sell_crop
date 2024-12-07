import 'package:dio/dio.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_and_selling_response.dart';
import 'package:sell_your_crop/features/home_screen/data/model/selling_store_request.dart';
import '../../../../core/error/api_error_handler.dart';

class SellingStoreDataSource {
  final ApiService _apiService;

  SellingStoreDataSource(this._apiService);

  Future<PurchaseAndSellingStoreResponse> sellingStore(SellingStoreRequest sellingStoreRequest) async {
    try {
      FormData formData = FormData();

      formData.fields.addAll([
        MapEntry('genre', sellingStoreRequest.genre),
        MapEntry('target', sellingStoreRequest.target),
        MapEntry('quantity', sellingStoreRequest.quantity),
        MapEntry('Price', sellingStoreRequest.price),
        MapEntry('phone', sellingStoreRequest.phone),
        MapEntry('city_id', sellingStoreRequest.cityId),
        MapEntry('type', sellingStoreRequest.type),
      ]);

      for (var imagePath in sellingStoreRequest.img) {
        formData.files.add(MapEntry('img[]', await MultipartFile.fromFile(imagePath)));
      }

      if (sellingStoreRequest.video.isNotEmpty) {
        formData.files.add(MapEntry('video', await MultipartFile.fromFile(sellingStoreRequest.video)));
      }

      final response = await _apiService.sellingStore(formData);
      return response;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e.response).apiErrorModel;
    }
  }
}