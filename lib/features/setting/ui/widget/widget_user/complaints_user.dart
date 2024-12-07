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
import 'package:sell_your_crop/features/setting/logic/cubit/complaint_cubit.dart';

class ComplaintsUser extends StatelessWidget {
  const ComplaintsUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ComplaintCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp(text: context.translate(LangKeys.name), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                controller: context.read<ComplaintCubit>().nameController,
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
            SizedBox(height: 45.h),
            TextApp(text: context.translate(LangKeys.phone), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                controller: context.read<ComplaintCubit>().phoneController,
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
            SizedBox(height: 45.h),
            TextApp(text: context.translate(LangKeys.complaints), style: TextStyleApp.font18black00Weight400.copyWith(fontWeight: FontWeight.w600)),
            CustomFadeInRight(
              duration: 500,
              child: TextFormFieldApp(
                contentPadding: EdgeInsetsDirectional.symmetric(vertical: 13.h,horizontal: 12.w),
                maxLines: 4,
                controller: context.read<ComplaintCubit>().msgController,
                background: Colors.white,
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
                textInputType: TextInputType.multiline,
                hintText: '',
              ),
            ),
            SizedBox(height: 110.h),
          ],
        )
    );
  }
}
