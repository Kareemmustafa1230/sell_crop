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
import 'package:sell_your_crop/features/setting/logic/cubit/log_out_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/log_out_state.dart';

class ButtonLogOutUser extends StatelessWidget {
  const ButtonLogOutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LogOutCubit,LogOutState>(
        builder: (context, state) {
          return state is Loading
              ?  const Center(
            child: SpinKitFadingCircle(color: Colors.green),
          ) : CustomFadeInRight(
            duration: 600,
            child: TextButtonScreen(
              color: ColorApp.green73,
              value2: 54.h,
              value1: 335.w,
              onPressed: () {
                context.read<LogOutCubit>().emitLogOutState();
              },
              child: Text(context.translate(LangKeys.signOut),
                style: TextStyleApp.font19green73Weight600.copyWith(
                    color: ColorApp.whiteFF),),
            ),
          );
        }
    );
  }
}