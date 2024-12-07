import 'package:freezed_annotation/freezed_annotation.dart';
part 'log_out_state.freezed.dart';

@freezed
class LogOutState with _$LogOutState{
  const factory LogOutState.initial() = _Initial;
  const factory LogOutState.loading() = Loading;
  const factory LogOutState.success({required String message}) = Success;
  const factory LogOutState.error({required String error}) = Error;

}

