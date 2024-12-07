import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_button_screen.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/up_data_new_password_profile_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/up_data_new_password_profile_state.dart';

class ButtonSaveNewPasswordProfileUser extends StatelessWidget {
  const ButtonSaveNewPasswordProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpDataNewPasswordProfileCubit, UpDataNewPasswordProfileState>(
        builder: (context, state) {
          return state is Loading
              ?  const Center(
            child: SpinKitFadingCircle(color: Colors.green),
          ) :
      CustomFadeInRight(
        duration: 600,
        child: TextButtonScreen(
          color: ColorApp.green73,
          value2: 54.h,
          value1: double.infinity.w,
          onPressed: () {
            validateThenDoUpDataPasswordProfile(context);
          },
          child: Text(context.translate(LangKeys.save),
            style: TextStyleApp.font19green73Weight600.copyWith(
                color: ColorApp.whiteFF),),
        ),
          );
        }
      );
  }


  void validateThenDoUpDataPasswordProfile(BuildContext context) {
    if (context.read<UpDataNewPasswordProfileCubit>().formKey.currentState!.validate()) {
      context.read<UpDataNewPasswordProfileCubit>().emitUpDataNwPasswordProfileState();
    }
  }
}
