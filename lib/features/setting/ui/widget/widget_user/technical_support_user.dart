import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/technical_support_cubit.dart';
import '../../../../../core/helpers/animate_do.dart';
import '../../../../../core/theme/Color/colors.dart';
import '../../../../../core/widget/app-text-form-field.dart';

class TechnicalSupportUser extends StatelessWidget {
  const TechnicalSupportUser({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<TechnicalSupportCubit>().formKey,
        child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal:13.w ,vertical: 40.h),
         child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp(text: context.translate(LangKeys.name), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                controller: context.read<TechnicalSupportCubit>().nameController,
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
                textInputType: TextInputType.name,
                hintText: context.translate(LangKeys.enterName),
              ),
            ),
            SizedBox(height: 30.h),
            TextApp(text: context.translate(LangKeys.phone), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                controller:context.read<TechnicalSupportCubit>().phoneController,
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
                textInputType: TextInputType.phone,
                hintText: context.translate(LangKeys.enterNumberPhone),
              ),
            ),
            SizedBox(height: 30.h),
            TextApp(text: context.translate(LangKeys.subject), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                controller: context.read<TechnicalSupportCubit>().subjectController,
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
                textInputType: TextInputType.text,
                hintText: context.translate(LangKeys.enterSubject),
              ),
            ),
            SizedBox(height: 30.h),
            TextApp(text: context.translate(LangKeys.message), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                contentPadding: EdgeInsetsDirectional.symmetric(horizontal:13.w ,vertical: 12.h),
                maxLines:4,
                controller:context.read<TechnicalSupportCubit>().msgController,
                background: Colors.transparent,
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
                textInputType: TextInputType.name,
                hintText: '',
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
        ),
    );
  }
}
