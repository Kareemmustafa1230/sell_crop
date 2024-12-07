import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/language/lang_keys.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'package:sell_your_crop/core/theme/text_style/text_style.dart';
import 'package:sell_your_crop/core/widget/text_app.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/button_code_otp.dart';
import 'package:sell_your_crop/features/forget_password/ui/widget/code_otp_bloc_listener.dart';

import '../../logic/cubit/code_otp_cubit.dart';

class EnterCodeSendPhoneNumberScreen extends StatefulWidget {
  const EnterCodeSendPhoneNumberScreen({super.key});

  @override
  _EnterCodeSendPhoneNumberScreenState createState() => _EnterCodeSendPhoneNumberScreenState();
}

class _EnterCodeSendPhoneNumberScreenState extends State<EnterCodeSendPhoneNumberScreen> {
  int countdown = 30;
  late Timer timer;
  FocusNode pinFocusNode = FocusNode();


  final defaultPinTheme = PinTheme(
    width: 52,
    height: 52,
    textStyle: TextStyleApp.font20black00Weight600,
    decoration: BoxDecoration(
      border: Border.all(color: ColorApp.green5F,width: 1),
      borderRadius: BorderRadius.circular(10.r),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 52,
    height: 52,
    textStyle: TextStyleApp.font20black00Weight600,
    decoration: BoxDecoration(
      border: Border.all(color: ColorApp.green5F,width: 1),
      borderRadius: BorderRadius.circular(10.r),
    ),
  );
  @override
  void initState() {
    super.initState();
    startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(pinFocusNode);
    });
  }
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          countdown = 30;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextApp(text: context.translate(LangKeys.verificationCode),style: TextStyleApp.font32black00Weight600,),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                 Text(context.translate(LangKeys.messageEnterCode)),
                const SizedBox(height: 52),
                    Pinput(
                      length: 6,
                      keyboardType: TextInputType.number,
                      controller: context.read<CodeOtpCubit>().otpController,
                      focusNode: pinFocusNode,
                      textInputAction: TextInputAction.next,
                      showCursor: true,
                      onSubmitted: (pin) async {
                        if (pin.length == 6) {
                          context.read<CodeOtpCubit>().otpController.text = pin;
                          await context.read<CodeOtpCubit>().emitResendOtpState();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Text(context.translate(LangKeys.messageEnterCode))),
                          );
                        }
                      },
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                ),
                 SizedBox(height: 120.h),
                const ButtonCodeOtp(),
                const CodeOtpBlocListeners(),
                 SizedBox(height: 20.h),
              ],
            ),
        ),
        ),
    );
  }
}
