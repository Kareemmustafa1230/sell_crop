import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/helpers/animate_do.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_button_screen.dart';

class ButtonSaveProfileUser extends StatelessWidget {
  const ButtonSaveProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      //   builder: (context, state) {
      //     return state is Loading
      //         ?  const Center(
      //       child: SpinKitFadingCircle(color: Colors.green),
      //     ) :
      CustomFadeInRight(
        duration: 600,
        child: TextButtonScreen(
          color: ColorApp.green73,
          value2: 54.h,
          value1: double.infinity.w,
          onPressed: () {
            //validateThenDoChangePassword(context);
          },
          child: Text(context.translate(LangKeys.save),
            style: TextStyleApp.font19green73Weight600.copyWith(
                color: ColorApp.whiteFF),),
        ),
        //   );
        // }
      );
  }
}

//   void validateThenDoChangePassword(BuildContext context) {
//     if (context.read<ChangePasswordCubit>().formKey.currentState!.validate()) {
//       context.read<ChangePasswordCubit>().emitChangePasswordState();
//     }
//   }
// }
