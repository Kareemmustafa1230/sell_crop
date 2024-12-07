 import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sell_your_crop/features/cart/data/data_source/purchase_data_source.dart';
import 'package:sell_your_crop/features/cart/data/data_source/sell_data_source.dart';
import 'package:sell_your_crop/features/cart/data/repo/purchase_repo.dart';
import 'package:sell_your_crop/features/cart/data/repo/sell_repo.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/purchase_cubit.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_cubit.dart';
import 'package:sell_your_crop/features/forget_password/data/data_source/change_password_data_source.dart';
import 'package:sell_your_crop/features/home_screen/data/data_source/cities_data_source.dart';
import 'package:sell_your_crop/features/home_screen/data/data_source/purchase_store_data_source.dart';
import 'package:sell_your_crop/features/home_screen/data/data_source/selling_store_data_source.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/cities_repo.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/purchase_store_repo.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/selling_store_repo.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/cities_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/purchase_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:sell_your_crop/features/setting/data/data_source/complaint_data_source.dart';
import 'package:sell_your_crop/features/setting/data/data_source/get_profile_data_source.dart';
import 'package:sell_your_crop/features/setting/data/data_source/log_out_data_source.dart';
import 'package:sell_your_crop/features/forget_password/data/repo/change_password_repo.dart';
import 'package:sell_your_crop/features/forget_password/data/repo/code_otp_repo.dart';
import 'package:sell_your_crop/features/setting/data/data_source/technical_support_data_source.dart';
import 'package:sell_your_crop/features/setting/data/data_source/up_data_new_password_profile_data_source.dart';
import 'package:sell_your_crop/features/setting/data/repo/complaint_repo.dart';
import 'package:sell_your_crop/features/setting/data/repo/get_profile_repo.dart';
import 'package:sell_your_crop/features/setting/data/repo/log_out_repo.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/change_password_cubit.dart';
import 'package:sell_your_crop/features/setting/data/repo/technical_support_repo.dart';
import 'package:sell_your_crop/features/setting/data/repo/up_data_new_password_profile_repo.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/complaint_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/get_profile_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/log_out_cubit.dart';
import 'package:sell_your_crop/features/login/data/repo/login_repo.dart';
import 'package:sell_your_crop/features/search/data/data_source/search_data_source.dart';
import 'package:sell_your_crop/features/search/data/repo/search_repo.dart';
import 'package:sell_your_crop/features/search/logic/cubit/search_cubit.dart';
import 'package:sell_your_crop/features/setting/data/data_source/partner_data_source.dart';
import 'package:sell_your_crop/features/setting/data/repo/copmany_policy_repo.dart';
import 'package:sell_your_crop/features/setting/data/repo/partner_repo.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/partner_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/technical_support_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/up_data_new_password_profile_cubit.dart';
import 'package:sell_your_crop/features/signup/data/data_source/sign_up_data_source.dart';
import 'package:sell_your_crop/features/signup/data/repo/sign_up_repo.dart';
import '../../../features/forget_password/data/data_source/code_otp_data_source.dart';
import '../../../features/forget_password/data/data_source/resend_otp_data_source.dart';
import '../../../features/forget_password/data/repo/resend_otp_repo.dart';
import '../../../features/forget_password/logic/cubit/code_otp_cubit.dart';
import '../../../features/forget_password/logic/cubit/resend_otp_cubit.dart';
import '../../../features/login/data/data_source/login_data_source.dart';
import '../../../features/login/logic/cubit/login_cubit.dart';
import '../../../features/setting/data/data_source/company_policy_data_source.dart';
import '../../../features/setting/logic/cubit/company_policy_cubit.dart';
import '../../../features/signup/logic/cubit/sign_up_user_cubit.dart';
import '../../app_cubit/app_cubit.dart';
import '../../helpers/shared_pref_helper.dart';
import '../api/api_factory.dart';
import '../api/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<SharedPrefHelper>(() => SharedPrefHelper());
  getIt.registerFactory(AppCubit.new);
  getIt.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);

   // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginDataSource>(() => LoginDataSource(getIt()));
   // signup
   getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
   getIt.registerFactory<SignUpUserCubit>(() => SignUpUserCubit(getIt()));
   getIt.registerLazySingleton<SignUpDataSource>(() => SignUpDataSource(getIt()));
  // ResendOtp
   getIt.registerLazySingleton<ResendOtpRepo>(() => ResendOtpRepo(getIt()));
   getIt.registerFactory<ResendOtpCubit>(() => ResendOtpCubit(getIt()));
   getIt.registerLazySingleton<ResendOtpDataSource>(() => ResendOtpDataSource(getIt()));
  // CodeOtp
   getIt.registerLazySingleton<CodeOtpRepo>(() => CodeOtpRepo(getIt()));
   getIt.registerFactory<CodeOtpCubit>(() => CodeOtpCubit(getIt()));
   getIt.registerLazySingleton<CodeOtpDataSource>(() => CodeOtpDataSource(getIt()));
   // Company Policy
   getIt.registerLazySingleton<CompanyPolicyRepo>(() => CompanyPolicyRepo(getIt()));
   getIt.registerFactory<CompanyPolicyCubit>(() => CompanyPolicyCubit(getIt()));
   getIt.registerLazySingleton<CompanyPolicyDataSource>(() => CompanyPolicyDataSource(getIt()));
   // Search
   getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
   getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));
   getIt.registerLazySingleton<SearchDataSource>(() => SearchDataSource(getIt()));
   // Purchase
  getIt.registerLazySingleton<PurchaseRepo>(() => PurchaseRepo(getIt()));
  getIt.registerFactory<PurchaseCubit>(() => PurchaseCubit(getIt()));
  getIt.registerLazySingleton<PurchaseDataSource>(() => PurchaseDataSource(getIt()));
  // Sell
  getIt.registerLazySingleton<SellRepo>(() => SellRepo(getIt()));
  getIt.registerFactory<SellCubit>(() => SellCubit(getIt()));
  getIt.registerLazySingleton<SellDataSource>(() => SellDataSource(getIt()));
  // Partner
  getIt.registerLazySingleton<PartnerRepo>(() => PartnerRepo(getIt()));
  getIt.registerFactory<PartnerCubit>(() => PartnerCubit(getIt()));
  getIt.registerLazySingleton<PartnerDataSource>(() => PartnerDataSource(getIt()));
  // ChangePassword
  getIt.registerLazySingleton<ChangePasswordRepo>(() => ChangePasswordRepo(getIt()));
  getIt.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(getIt()));
  getIt.registerLazySingleton<ChangePasswordDataSource>(() => ChangePasswordDataSource(getIt()));
  //Log Out
  getIt.registerLazySingleton<LogOutRepo>(() => LogOutRepo(getIt()));
  getIt.registerFactory<LogOutCubit>(() => LogOutCubit(getIt()));
  getIt.registerLazySingleton<LogOutDataSource>(() => LogOutDataSource(getIt()));
  //Complaint
  getIt.registerLazySingleton<ComplaintRepo>(() => ComplaintRepo(getIt()));
  getIt.registerFactory<ComplaintCubit>(() => ComplaintCubit(getIt()));
  getIt.registerLazySingleton<ComplaintDataSource>(() => ComplaintDataSource(getIt()));
 //Technical Support
  getIt.registerLazySingleton<TechnicalSupportRepo>(() => TechnicalSupportRepo(getIt()));
  getIt.registerFactory<TechnicalSupportCubit>(() => TechnicalSupportCubit(getIt()));
  getIt.registerLazySingleton<TechnicalSupportDataSource>(() => TechnicalSupportDataSource(getIt()));
  // GetProfile
  getIt.registerLazySingleton<GetProfileRepo>(() => GetProfileRepo(getIt()));
  getIt.registerFactory<GetProfileCubit>(() => GetProfileCubit(getIt()));
  getIt.registerLazySingleton<GetProfileDataSource>(() => GetProfileDataSource(getIt()));
  // UpDataNewPasswordProfile
  getIt.registerLazySingleton<UpDataNewPasswordProfileRepo>(() => UpDataNewPasswordProfileRepo(getIt()));
  getIt.registerFactory<UpDataNewPasswordProfileCubit>(() => UpDataNewPasswordProfileCubit(getIt()));
  getIt.registerLazySingleton<UpDataNewPasswordProfileDataSource>(() => UpDataNewPasswordProfileDataSource(getIt()));
  // Cities
  getIt.registerLazySingleton<CitiesRepo>(() => CitiesRepo(getIt()));
  getIt.registerFactory<CitiesCubit>(() => CitiesCubit(getIt()));
  getIt.registerLazySingleton<CitiesDataSource>(() => CitiesDataSource(getIt()));
  // Purchase Store
  getIt.registerLazySingleton<PurchaseStoreRepo>(() => PurchaseStoreRepo(getIt()));
  getIt.registerFactory<PurchaseStoreCubit>(() => PurchaseStoreCubit(getIt()));
  getIt.registerLazySingleton<PurchaseStoreDataSource>(() => PurchaseStoreDataSource(getIt()));
  // Selling Store
  getIt.registerLazySingleton<SellingStoreRepo>(() => SellingStoreRepo(getIt()));
  getIt.registerFactory<SellingStoreCubit>(() => SellingStoreCubit(getIt()));
  getIt.registerLazySingleton<SellingStoreDataSource>(() => SellingStoreDataSource(getIt()));


}