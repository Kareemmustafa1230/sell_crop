import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/search/data/model/search_response.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState{
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = Loading;
  const factory SearchState.success({required SearchResponse searchResponse}) = Success;
  const factory SearchState.error({required String error}) = Error;

}



