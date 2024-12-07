import 'package:freezed_annotation/freezed_annotation.dart';
part 'complaint_request.g.dart';


@JsonSerializable()
class ComplaintRequest {
  final String name ;
  final String phone;
  final String msg;

  ComplaintRequest({
    required this.phone,
    required this.msg,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$ComplaintRequestToJson(this);
}
