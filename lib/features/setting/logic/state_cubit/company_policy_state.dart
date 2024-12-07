import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/company_policy_response.dart';
part 'company_policy_state.freezed.dart';

@freezed
class CompanyPolicyState<T> with _$CompanyPolicyState<T> {
  const factory CompanyPolicyState.initial() = _Initial;
  const factory CompanyPolicyState.loading() = Loading;
  const factory CompanyPolicyState.success({required CompanyPolicyResponse companyPolicyResponse}) = Success<T>;
  const factory CompanyPolicyState.error({required String error}) = Error;
}