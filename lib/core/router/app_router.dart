import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/change_password_cubit.dart';
import 'package:sell_your_crop/features/home/ui/screen/home_screen.dart';
import 'package:sell_your_crop/features/forget_password/ui/screen/change_password.dart';
import 'package:sell_your_crop/features/forget_password/ui/screen/enter_code_send_phone_number.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/purchase_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/ui/screen/purchase_request.dart';
import 'package:sell_your_crop/features/home_screen/ui/screen/sell_request.dart';
import 'package:sell_your_crop/features/login/logic/cubit/login_cubit.dart';
import 'package:sell_your_crop/features/onboarding/ui/screen/onboarding.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/company_policy_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/get_profile_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/partner_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/screen/company_policy.dart';
import 'package:sell_your_crop/features/signup/logic/cubit/sign_up_user_cubit.dart';
import '../../features/forget_password/logic/cubit/code_otp_cubit.dart';
import '../../features/forget_password/logic/cubit/resend_otp_cubit.dart';
import '../../features/forget_password/ui/screen/enter_phone_number.dart';
import '../../features/login/ui/screen/login.dart';
import '../../features/setting/ui/screen/partner.dart';
import '../../features/signup/ui/screen/signup.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arg = settings.arguments ;
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
              create: (context) => getIt<LoginCubit>(),
            child: const Login(),
          ),
          );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => getIt<SignUpUserCubit>(),
            child: const SignUp(),
          ),
        );
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const Onboarding());
      case Routes.enterPhoneNumber:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => getIt<ResendOtpCubit>(),
            child: const EnterPhoneNumber(),
          ),
        );
      case Routes.enterCode:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => getIt<CodeOtpCubit>(),
            child: const EnterCodeSendPhoneNumber(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const Home());
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => getIt<ChangePasswordCubit>(),
            child: const ChangePassword(),
          ),
        );
      case Routes.partner:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => getIt<PartnerCubit>()..emitPartnerStates(),
            child: const Partner(),
          ),
        );
      case Routes.companyPolicy:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => getIt<CompanyPolicyCubit>()..emitCompanyPolicyStates(),
            child: const CompanyPolicy(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
