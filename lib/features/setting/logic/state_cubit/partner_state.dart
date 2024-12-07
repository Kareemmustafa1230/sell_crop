import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/partner_response.dart';
part 'partner_state.freezed.dart';

@freezed
class PartnerState<T> with _$PartnerState<T> {
  const factory PartnerState.initial() = _Initial;
  const factory PartnerState.loading() = Loading;
  const factory PartnerState.success({required PartnerResponse partnerResponse}) = Success<T>;
  const factory PartnerState.error({required String error}) = Error;
}