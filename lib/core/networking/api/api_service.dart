import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sell_your_crop/features/forget_password/data/model/change_password_request.dart';
import 'package:sell_your_crop/features/forget_password/data/model/code_otp_and_up_data_password_profile_response.dart';
import 'package:sell_your_crop/features/home_screen/data/model/cities_response.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_request.dart';
import 'package:sell_your_crop/features/home_screen/data/model/purchase_store_and_selling_response.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/complaint_request.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/up_data_password_request.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/get_profile_response.dart';
import 'package:sell_your_crop/features/setting/data/model/response_model/partner_response.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/technical_support_request.dart';
import '../../../features/forget_password/data/model/code_otp_request.dart';
import '../../../features/forget_password/data/model/number_phone_request.dart';
import '../../../features/forget_password/data/model/number_phone_change_password_log_out_response.dart';
import '../../../features/login/data/model/login_request_body.dart';
import '../../../features/login/data/model/login_user_response.dart';
import '../../../features/search/data/model/search_response.dart';
import '../../../features/setting/data/model/response_model/company_policy_response.dart';
import '../../../features/signup/data/model/sign_up_user_request.dart';
import '../../../features/signup/data/model/sign_up_user_response.dart';
import '../constants/api_constants.dart';
part 'api_service.g.dart';


@RestApi(baseUrl: ApiConstants.baserUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

   @POST(ApiConstants.login)
    Future<LoginUserResponse> login(
       @Body() LoginRequestBody loginRequestBody,
       );

   @POST(ApiConstants.register)
   Future<SignUpUserResponse> signup(
       @Body() SignUpUserRequest signUpUserRequest,
       );

  @POST(ApiConstants.sendOtp)
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> sendCodeToPhone(
      @Body() NumberPhoneRequest numberPhoneRequest,
      );

  @POST(ApiConstants.verifyOtp)
  Future<CodeOtpAndUpDataPasswordProfileResponse> verifyOtp(
      @Body() CodeOtpRequest codeOtpRequest,
      );

  @POST(ApiConstants.updateNewPasswordProfile)
  Future<CodeOtpAndUpDataPasswordProfileResponse> updateNewPasswordProfile(
      @Body() UpDataPasswordRequest upDataPasswordRequest,
      @Header('Accept') String accept,
      @Header('Accept-Language') String acceptLanguage,
      );

  @POST(ApiConstants.changePassword)
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> changePassword(
      @Body() ChangePasswordRequest changePasswordRequest,
      @Header('Accept') String accept,
      );

  @POST(ApiConstants.complaint)
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> complaint(
      @Body() ComplaintRequest complaintRequest,
      @Header('Accept-Language') String acceptLanguage,
      );

  @POST(ApiConstants.technicalSupport)
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> technicalSupport(
      @Body() TechnicalSupportRequest technicalSupportRequest,
      @Header('Accept-Language') String acceptLanguage,
      );

  @POST(ApiConstants.logout)
  Future<NumberPhoneAndChangePasswordAndLogOutAndComplaintAndTechnicalSupportResponse> logout(
      @Header('Authorization') String authorization,
      @Header('Accept') String accept,
      );

  @POST(ApiConstants.store)
  Future<PurchaseAndSellingStoreResponse> purchaseStore(
      @Body() PurchaseStoreRequest purchaseStoreRequest,
      );

  @POST(ApiConstants.store)
  Future<PurchaseAndSellingStoreResponse> sellingStore(
      @Body() FormData formData,
      );

   @GET(ApiConstants.policy)
   Future<CompanyPolicyResponse>companyPolicy(
       @Header('Accept-Language') String acceptLanguage
       );

  @GET(ApiConstants.search)
  Future<SearchResponse>search(
      @Query('search') String searchQuery,
      @Header('Accept-Language') String acceptLanguage,
      @Header('Accept') String accept,
      );

  @GET(ApiConstants.purchase)
  Future<SearchResponse> purchase(
      @Header('Accept-Language') String acceptLanguage,
      );

  @GET(ApiConstants.sell)
  Future<SearchResponse>sell(
      @Header('Accept-Language') String acceptLanguage,
      );

  @GET(ApiConstants.partners)
  Future<PartnerResponse>partners(
      @Header('Accept-Language') String acceptLanguage,
      );

  @GET(ApiConstants.getProfile)
  Future<GetProfileResponse>getProfile(
      @Header('Accept') String accept,
      );

  @GET(ApiConstants.cities)
  Future<CitiesResponse>cities(
      @Header('Accept-Language') String acceptLanguage,
      );

}
