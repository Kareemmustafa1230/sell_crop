import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/api/api_service.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/search/data/model/search_response.dart';
import '../../../../core/error/api_error_handler.dart';

class SearchDataSource {
  final ApiService _apiService;

  SearchDataSource(this._apiService);

  // Search
  Future<SearchResponse> search(String searchQuery) async {
    try {
      final response = await _apiService.search(
        searchQuery,
        '${getIt<SharedPrefHelper>().getData(key: ApiKey.language)}',
          'application/json'
      );
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
  }
