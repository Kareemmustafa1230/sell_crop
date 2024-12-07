import 'package:dio/dio.dart';
import '../../helpers/shared_pref_helper.dart';
import '../constants/api_constants.dart';
import '../di/dependency_injection.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.authorization] =
    getIt<SharedPrefHelper>().getData(key: ApiKey.authorization) != null
        ? 'Bearer ${getIt<SharedPrefHelper>().getData(key: ApiKey.authorization)}'
        : null;
    super.onRequest(options, handler);
  }
}
