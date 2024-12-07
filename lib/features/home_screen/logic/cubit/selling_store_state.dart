import 'package:freezed_annotation/freezed_annotation.dart';
part 'selling_store_state.freezed.dart';

@freezed
class SellingStoreState<T> with _$SellingStoreState<T> {
  const factory SellingStoreState.initial() = _Initial;
  const factory SellingStoreState.loading() = Loading;
  const factory SellingStoreState.success({required String message}) = Success<T>;
  const factory SellingStoreState.error({required String error}) = Error;
}