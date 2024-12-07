import 'package:sell_your_crop/features/cart/data/data_source/sell_data_source.dart';
import 'package:sell_your_crop/features/search/data/model/search_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';

class SellRepo {
  final SellDataSource _sellDataSource;

  SellRepo(this._sellDataSource);

//Sell
  Future<ApiResult<SearchResponse>> sell( ) async {
    try {
      final response = await _sellDataSource.sell();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
