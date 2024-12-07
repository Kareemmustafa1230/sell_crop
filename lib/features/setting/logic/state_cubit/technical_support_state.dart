import 'package:freezed_annotation/freezed_annotation.dart';
part 'technical_support_state.freezed.dart';

@freezed
class TechnicalSupportState<T> with _$TechnicalSupportState<T> {
  const factory TechnicalSupportState.initial() = _Initial;
  const factory TechnicalSupportState.loading() = Loading;
  const factory TechnicalSupportState.success({required String message }) = Success<T>;
  const factory TechnicalSupportState.error({required String error}) = Error;
}