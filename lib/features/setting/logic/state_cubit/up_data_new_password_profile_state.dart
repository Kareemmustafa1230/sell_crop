import 'package:freezed_annotation/freezed_annotation.dart';
part 'up_data_new_password_profile_state.freezed.dart';

@freezed
class UpDataNewPasswordProfileState<T> with _$UpDataNewPasswordProfileState<T> {
  const factory UpDataNewPasswordProfileState.initial() = _Initial;
  const factory UpDataNewPasswordProfileState.loading() = Loading;
  const factory UpDataNewPasswordProfileState.success({required String message }) = Success<T>;
  const factory UpDataNewPasswordProfileState.error({required String error}) = Error;
}