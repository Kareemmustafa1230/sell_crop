import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/app-text-form-field.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/get_profile_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/get_profile_state.dart';


class UpdateProfileUser extends StatelessWidget {
  const UpdateProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      builder: (context, state) {
        if (state is Success) {
          return Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: context.translate(LangKeys.name),
                  style: TextStyleApp.font18black00Weight400,
                ),
                CustomFadeInRight(
                  duration: 500,
                  child: TextFormFieldApp(
                    enableBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.grey, width: 1.w,),
                    ),
                    focusBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.grey, width: 1.w),
                    ),
                    controller: context.read<GetProfileCubit>().nameController,
                    background: ColorApp.whiteFF,
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
                  style: TextStyleApp.font18black00Weight400,
                ),
                CustomFadeInLeft(
                  duration: 500,
                  child: TextFormFieldApp(
                    enableBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.grey, width: 1.w,),
                    ),
                    focusBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Colors.grey, width: 1.w),
                    ),
                    controller: context
                        .read<GetProfileCubit>()
                        .phoneController,
                    background: ColorApp.whiteFF,
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
              ],
            ),
          );
        }   if (state is Loading) {
          return  const Center( child:SpinKitFadingCircle(color: Colors.black),
          );
        }
        return  const Center(
          heightFactor: BorderSide.strokeAlignOutside,
          child:  SpinKitFadingCircle(
            color: Colors.red,
            size: 50,
          ),
        );
      },
    );
  }
}