import 'package:freezed_annotation/freezed_annotation.dart';
part 'number_phone_change_password_log_out_response.g.dart';


@JsonSerializable()
class  NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse{
  NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse({
    this.data,
    this.msg,
    this.status,
  });

  String? data;
  String? msg;
  int? status;

  factory NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse.fromJson(Map<String, dynamic> json) =>  _$NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponseFromJson(json);
}




