import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/features/login/ui/widget/login_bloc_listener.dart';
import 'package:sell_your_crop/features/login/ui/widget/button_login.dart';
import 'package:sell_your_crop/features/login/ui/widget/container_image_login.dart';
import 'package:sell_your_crop/features/login/ui/widget/go_to_sign_up_or_in.dart';
import 'package:sell_your_crop/features/login/ui/widget/login_user.dart';
import '../../../../core/theme/Color/colors.dart';
import 'logo_button_change_lang.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorApp.green73,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ContainerImageLogin(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: const LogoAndButtonLang(nameKey:LangKeys.login,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: const LoginUser(),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: const ButtonLogin(),
              ),
              const LoginBlocListeners(),
              SizedBox(
                height: 15.h,
              ),
              const GoToSignUpOrIn(textScreenSignUP: LangKeys.noYouHaveAccount, nameKeyScreenSignUp: LangKeys.signUp, routeScreen: Routes.signUpScreen,),
            ],
          ),
        ),
      ),
    );
  }
}
