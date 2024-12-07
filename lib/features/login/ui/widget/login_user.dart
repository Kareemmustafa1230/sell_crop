import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/login/logic/cubit/login_cubit.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/widget/app-text-form-field.dart';
import '../../../../core/widget/company_policy_forgot_password.dart';

class LoginUser extends StatelessWidget {
  const LoginUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
       key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(text: context.translate(LangKeys.phone), style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
              background: ColorApp.grey9D,
              hintStyle: const TextStyle(
                color: ColorApp.greyEA,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              textInputType: TextInputType.phone,
              hintText: context.translate(LangKeys.numberPhone),
               controller: context.read<LoginCubit>().mobileController,
              validationMsg: context.translate(LangKeys.phone),
              validator: (value) {
                if ( value == null || value.isEmpty || value.length != 11) {
                  return context.translate(LangKeys.phone);
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(text: context.translate(LangKeys.password), style: TextStyleApp.font18black00Weight400),
          CustomFadeInLeft(
            duration: 500,
            child: TextFormFieldApp(
              background: ColorApp.grey9D,
              hintStyle: const TextStyle(
                color: ColorApp.greyEA,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              textInputType: TextInputType.visiblePassword,
              hintText: context.translate(LangKeys.enterPassword),
               controller: context.read<LoginCubit>().passwordController,
              validationMsg: context.translate(LangKeys.validPasswrod),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return null;
              },
              isPassword: true,
              showEye: true,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          const RememberMeAndForgotPassword(),
        ],
      ),
    );
  }
}
