import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState{
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.loading() = Loading;
  const factory ChangePasswordState.success({required String message}) = Success;
  const factory ChangePasswordState.error({required String error}) = Error;

}

