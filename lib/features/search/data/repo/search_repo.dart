import 'package:sell_your_crop/features/search/data/model/search_response.dart';
import '../../../../core/error/api_error_handler.dart';
import '../../../../core/networking/api/api_result.dart';
import '../data_source/search_data_source.dart';

class SearchRepo {
  final SearchDataSource _searchDataSource;

  SearchRepo(this._searchDataSource);

//search
  Future<ApiResult<SearchResponse>> search(String searchQuery) async {
    try {
      final response = await _searchDataSource.search(searchQuery);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
