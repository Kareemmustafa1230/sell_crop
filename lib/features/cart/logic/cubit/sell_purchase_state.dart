import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/search/data/model/search_response.dart';
part 'sell_purchase_state.freezed.dart';

@freezed
class SellAndPurchaseState with _$SellAndPurchaseState{
  const factory SellAndPurchaseState.initial() = _Initial;
  const factory SellAndPurchaseState.loading() = Loading;
  const factory SellAndPurchaseState.success({required SearchResponse searchResponse}) = Success;
  const factory SellAndPurchaseState.error({required String error}) = Error;

}



