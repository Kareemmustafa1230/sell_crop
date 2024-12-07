import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/features/signup/logic/cubit/sign_up_user_cubit.dart';
import 'package:sell_your_crop/features/signup/ui/widget/drop_down_button_form_field.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/app-text-form-field.dart';
import '../../../../core/widget/check_box.dart';
import '../../../../core/widget/text_app.dart';

class SignUpUser extends StatelessWidget {
  const SignUpUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpUserCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
              text: context.translate(LangKeys.name),
              style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
              controller: context.read<SignUpUserCubit>().nameController,
              background: ColorApp.grey9D,
              hintStyle: const TextStyle(
                color: ColorApp.greyEA,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              textInputType: TextInputType.name,
              hintText: context.translate(LangKeys.enterName),
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(
              text: context.translate(LangKeys.phone),
              style: TextStyleApp.font18black00Weight400),
          CustomFadeInLeft(
            duration: 500,
            child: TextFormFieldApp(
              controller: context.read<SignUpUserCubit>().mobileController,
              background: ColorApp.grey9D,
              hintStyle: const TextStyle(
                color: ColorApp.greyEA,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              textInputType: TextInputType.phone,
              hintText: context.translate(LangKeys.numberPhone),
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(
              text: context.translate(LangKeys.password),
              style: TextStyleApp.font18black00Weight400),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
              controller: context.read<SignUpUserCubit>().passwordController,
              background: ColorApp.grey9D,
              hintStyle: const TextStyle(
                color: ColorApp.greyEA,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              textInputType: TextInputType.visiblePassword,
              hintText: context.translate(LangKeys.enterPassword),
              isPassword: true,
              showEye: true,
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(
              text: context.translate(LangKeys.job),
              style: TextStyleApp.font18black00Weight400),
          const CustomFadeInLeft(
            duration: 500,
            child: DropdownTextFormFieldApp(),
          ),
          SizedBox(height: 10.h),
          const CheckBoxApp(),
        ],
      ),
    );
  }
}
