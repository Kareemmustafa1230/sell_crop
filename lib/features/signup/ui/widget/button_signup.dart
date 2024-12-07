import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/widget/toast.dart';
import 'package:sell_your_crop/features/signup/logic/cubit/sign_up_user_cubit.dart';
import 'package:sell_your_crop/features/signup/logic/cubit/sign_up_user_state.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/networking/di/dependency_injection.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_button_screen.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpUserCubit, SignupState>(
        builder: (context, state) {
          return state is Loading
              ? const Center(
            child: SpinKitFadingCircle(color: Colors.green),
          )
              : CustomFadeInRight(
            duration: 600,
            child: TextButtonScreen(
              color: ColorApp.green73,
              value2: 54.h,
              value1: 335.w,
              onPressed: () {
                validateThenDoSignUp(context);
              },
              child: Text(context.translate(LangKeys.signUp),
                style: TextStyleApp.font19green73Weight600.copyWith(
                    color: ColorApp.whiteFF),
              ),
            ),
          );
        }
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (ApiConstants.valid == true) {
      if (context
          .read<SignUpUserCubit>()
          .formKey
          .currentState!
          .validate()) {
        final String? selectedItem = getIt<SharedPrefHelper>().getData(
            key: 'selectedItem');
        if (selectedItem != null && selectedItem.isNotEmpty) {
          context.read<SignUpUserCubit>().emitSignupStates(
            job: selectedItem,
          );
        } else {
          toast(text: "يرجى اختيار وظيفة", color: Colors.red);
        }
      }
    }
  }
}
