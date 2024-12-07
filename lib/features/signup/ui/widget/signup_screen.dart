import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/router/routers.dart';
import 'package:sell_your_crop/features/login/ui/widget/go_to_sign_up_or_in.dart';
import 'package:sell_your_crop/features/login/ui/widget/logo_button_change_lang.dart';
import 'package:sell_your_crop/features/signup/ui/widget/button_signup.dart';
import 'package:sell_your_crop/features/signup/ui/widget/signup_bloc_listeners.dart';
import 'package:sell_your_crop/features/signup/ui/widget/signup_user.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical:20.h),
              child:  Column(
                children: [
                  const LogoAndButtonLang(nameKey:LangKeys.createAccount ),
                  SizedBox(height: 50.h),
                  const SignUpUser(),
                  SizedBox(height: 50.h),
                  const ButtonSignUp(),
                  const SignupBlocListeners(),
                  SizedBox(height: 15.h),
                  const GoToSignUpOrIn(textScreenSignUP: LangKeys.youHaveAccount, nameKeyScreenSignUp: LangKeys.login, routeScreen:Routes.loginScreen,)
                ],
              ),
            ),
          ),
      ),
    ) ;
  }
}
