import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/app-text-form-field.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/change_password_cubit.dart';

class ChangePasswordUser extends StatelessWidget {
  const ChangePasswordUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Form (
      key: context.read<ChangePasswordCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp(text: context.translate(LangKeys.newPassword), style: TextStyleApp.font14black00Weight500),
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
                textInputType: TextInputType.text,
                hintText: context.translate(LangKeys.password),
                controller: context.read<ChangePasswordCubit>().passwordController,
                validationMsg: context.translate(LangKeys.password),
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return context.translate(LangKeys.password);
                  }
                  return null;
                },
                isPassword: true,
                showEye: true,
              ),
            ),
            SizedBox(height:50.h,),
            TextApp(text: context.translate(LangKeys.confirmPassword), style: TextStyleApp.font14black00Weight500),
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
                textInputType: TextInputType.text,
                hintText: context.translate(LangKeys.password),
                controller: context.read<ChangePasswordCubit>().confirmPasswordController,
                validationMsg: context.translate(LangKeys.password),
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return context.translate(LangKeys.password);
                  }
                  return null;
                },
                isPassword: true,
                showEye: true,
              ),
            ),
          ],
        ),
    );
  }
}
