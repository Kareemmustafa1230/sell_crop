import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/search/data/model/search_response.dart';
import '../../../../core/error/api_error_handler.dart';

class PurchaseDataSource {
  final ApiService _apiService;

  PurchaseDataSource(this._apiService);

  // Purchase
  Future<SearchResponse> purchase() async {
    try {
      final response = await _apiService.purchase(
          '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}'
      );
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
  }
