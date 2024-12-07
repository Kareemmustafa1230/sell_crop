import '../networking/constants/api_constants.dart';

class ErrorModel {
  final int status;
  final String msg;
  final String? data;

  ErrorModel({required this.status, required this.msg,this.data});
  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      msg: jsonData[ApiKey.message],
      status: jsonData[ApiKey.status],
      data: jsonData[ApiKey.data],
    );
  }
}