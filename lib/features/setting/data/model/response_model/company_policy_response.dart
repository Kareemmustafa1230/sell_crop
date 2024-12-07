import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_policy_response.g.dart';


@JsonSerializable()
class CompanyPolicyResponse {
  int? status;
  String? msg;
  String? data;

  CompanyPolicyResponse({this.status, this.msg, this.data});

  factory CompanyPolicyResponse.fromJson(Map<String, dynamic> json) =>  _$CompanyPolicyResponseFromJson(json);


}