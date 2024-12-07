import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import '../../../../core/helpers/animate_do.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/widget/app-text-form-field.dart';
import '../../logic/cubit/resend_otp_cubit.dart';

class TextFormSendPhone extends StatelessWidget {
  const TextFormSendPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<ResendOtpCubit>().formKey,
      child: CustomFadeInRight(
        duration: 500,
        child: TextFormFieldApp(
          background: ColorApp.grey9D,
          hintStyle: const TextStyle(
            color: ColorApp.greyEA,
          ),
          inputTextStyle: const TextStyle(
            color: ColorApp.black00,
          ),
          textInputType: TextInputType.phone,
          hintText: context.translate(LangKeys.numberPhone),
           controller: context.read<ResendOtpCubit>().mobileController,
          validationMsg: context.translate(LangKeys.password),
          validator: (value) {
            if (value == null || value.isEmpty || value.length != 11) {
              return context.translate(LangKeys.phone);
            }
            return null;
          },
        ),
      ),
    );
  }
}
