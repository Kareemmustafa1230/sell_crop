import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/theme/Color/colors.dart';
import '../../../../core/theme/text_style/text_style.dart';
import '../../../../core/widget/text_app.dart';
import '../../../../core/widget/text_button_screen.dart';
import '../../logic/cubit/code_otp_cubit.dart';
import '../../logic/cubit/code_otp_state.dart';

class ButtonCodeOtp extends StatelessWidget {
  const ButtonCodeOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeOtpCubit, CodeOtpState>(
        builder: (context, state) {
          return state is Loading
              ? const Center(
            child: SpinKitFadingCircle(color: Colors.green),
          )
              : CustomFadeInRight(
            duration: 600,
            child: TextButtonScreen(
              onPressed: () async {
                final otpCubit = context.read<CodeOtpCubit>();
                if (otpCubit.otpController.text.length == 6) {
                  await otpCubit.emitResendOtpState();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter a 6-digit code.')),
                  );
                }
              },
              color: ColorApp.green73,
              value2: 54.h,
              value1: 335.w,
              child: TextApp(text: context.translate(LangKeys.send),
                style: TextStyleApp.font19green73Weight600.copyWith(
                    color: ColorApp.whiteFF),
              ),
            ),
          );
        }
    );
  }
}
