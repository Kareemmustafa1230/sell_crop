import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/resend_otp_cubit.dart';
import '../widget/enter_phone_number_screen.dart';

class EnterPhoneNumber extends StatelessWidget {
  const EnterPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResendOtpCubit>(),
      child: const EnterPhoneNumberScreen(),
    );
  }
}
