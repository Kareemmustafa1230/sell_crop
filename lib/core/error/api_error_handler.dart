import 'package:dio/dio.dart';
import '../networking/constants/api_constants.dart';
import 'error_model.dart';



// TODO: wallahy I will refactor this .. Omar Ahmed
enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API , LOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data (no content)
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ErrorModel(
            status: ResponseCode.NO_CONTENT, msg: ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return ErrorModel(
            status: ResponseCode.BAD_REQUEST,
            msg: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return ErrorModel(
            status: ResponseCode.FORBIDDEN, msg: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return ErrorModel(
            status: ResponseCode.UNAUTORISED,
            msg: ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return ErrorModel(
            status: ResponseCode.NOT_FOUND, msg: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ErrorModel(
            status: ResponseCode.INTERNAL_SERVER_ERROR,
            msg: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return ErrorModel(
            status: ResponseCode.CONNECT_TIMEOUT,
            msg: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return ErrorModel(
            status: ResponseCode.CANCEL, msg: ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return ErrorModel(
            status: ResponseCode.RECIEVE_TIMEOUT,
            msg: ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return ErrorModel(
            status: ResponseCode.SEND_TIMEOUT,
            msg: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return ErrorModel(
            status: ResponseCode.CACHE_ERROR,
            msg: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return ErrorModel(
            status: ResponseCode.NO_INTERNET_CONNECTION,
            msg: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return ErrorModel(
            status: ResponseCode.DEFAULT, msg: ResponseMessage.DEFAULT);
    }
  }
}

class ErrorHandler implements Exception {
  late ErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      //apiErrorModel = DataSource.DEFAULT.getFailure();
      apiErrorModel = error;

    }
  }
}

ErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badResponse:
      return DataSource.DEFAULT.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}