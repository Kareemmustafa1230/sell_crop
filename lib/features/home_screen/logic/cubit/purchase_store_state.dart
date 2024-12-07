import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchase_store_state.freezed.dart';

@freezed
class PurchaseStoreState<T> with _$PurchaseStoreState<T> {
  const factory PurchaseStoreState.initial() = _Initial;
  const factory PurchaseStoreState.loading() = Loading;
  const factory PurchaseStoreState.success({required String message}) = Success<T>;
  const factory PurchaseStoreState.error({required String error}) = Error;
}