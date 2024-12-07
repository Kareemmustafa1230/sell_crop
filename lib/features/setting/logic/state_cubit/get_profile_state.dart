import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/get_profile_response.dart';
part 'get_profile_state.freezed.dart';

@freezed
class GetProfileState<T> with _$GetProfileState<T> {
  const factory GetProfileState.initial() = _Initial;
  const factory GetProfileState.loading() = Loading;
  const factory GetProfileState.success({required GetProfileResponse getProfileResponse}) = Success<T>;
  const factory GetProfileState.error({required String error}) = Error;
}