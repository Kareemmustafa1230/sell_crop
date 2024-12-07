import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/resend_otp_cubit.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/resend_otp_state.dart';
import '../../../../core/router/routers.dart';
import '../../../../core/widget/toast.dart';

class ResendOtpBlocListeners extends StatelessWidget {
  const ResendOtpBlocListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResendOtpCubit, ResendOtpState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          getIt<SharedPrefHelper>().saveData(key: ApiKey.phone, value: state.data);
          context.pushNamed(Routes.enterCode,arguments: state.data);
        } else if (state is Error) {
          toast(text: state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
