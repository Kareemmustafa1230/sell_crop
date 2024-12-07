// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_phone_change_password_log_out_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse
    _$NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponseFromJson(
            Map<String, dynamic> json) =>
        NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse(
          data: json['data'] as String?,
          msg: json['msg'] as String?,
          status: (json['status'] as num?)?.toInt(),
        );

Map<String, dynamic>
    _$NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponseToJson(
            NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse
                instance) =>
        <String, dynamic>{
          'data': instance.data,
          'msg': instance.msg,
          'status': instance.status,
        };
