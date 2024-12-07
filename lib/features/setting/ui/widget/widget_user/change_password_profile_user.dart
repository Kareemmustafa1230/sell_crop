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
import 'package:sell_your_crop/features/setting/logic/cubit/up_data_new_password_profile_cubit.dart';

class ChangePasswordProfileUser extends StatelessWidget {
  const ChangePasswordProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UpDataNewPasswordProfileCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextApp(text: context.translate(LangKeys.oldPassword), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
              iconColor:ColorApp.grey9D,
              controller: context.read<UpDataNewPasswordProfileCubit>().oldPasswordController,
              background: Colors.transparent,
              hintStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              enableBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w,),
              ),
              focusBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w),
              ),
              textInputType: TextInputType.visiblePassword,
              hintText: context.translate(LangKeys.enterOldPassword),
              isPassword: true,
              showEye: true,
            ),
          ),
          SizedBox(height: 45.h),
          TextApp(text: context.translate(LangKeys.newPassword), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
          CustomFadeInRight(
            duration: 500,
            child: TextFormFieldApp(
              iconColor:ColorApp.grey9D,
               controller: context.read<UpDataNewPasswordProfileCubit>().newPasswordController,
              background: Colors.transparent,
              hintStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              inputTextStyle: const TextStyle(
                color: ColorApp.black00,
              ),
              enableBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w,),
              ),
              focusBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w),
              ),
              textInputType: TextInputType.visiblePassword,
              hintText: context.translate(LangKeys.enterNewPassword),
              isPassword: true,
              showEye: true,
            ),
          ),
          SizedBox(height: 45.h),
          TextApp(text:  context.translate(LangKeys.confirmPassword), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                iconColor:ColorApp.grey9D,
                 controller: context.read<UpDataNewPasswordProfileCubit>().confirmationPasswordController,
                background: Colors.transparent,
                hintStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                inputTextStyle: const TextStyle(
                  color: ColorApp.black00,
                ),
                enableBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w,),
                ),
                focusBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey, width: 1.w),
                ),
                textInputType: TextInputType.visiblePassword,
                hintText: context.translate(LangKeys.enterConfirmPassword),
                isPassword: true,
                showEye: true,
              ),
            ),
        ],)
    );
  }
}
