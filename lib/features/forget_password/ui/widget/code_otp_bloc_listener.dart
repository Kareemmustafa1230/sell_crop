import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import '../../../../core/router/routers.dart';
import '../../../../core/widget/toast.dart';
import '../../logic/cubit/code_otp_cubit.dart';
import '../../logic/cubit/code_otp_state.dart';

class CodeOtpBlocListeners extends StatelessWidget {
  const CodeOtpBlocListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CodeOtpCubit,CodeOtpState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          getIt<SharedPrefHelper>().saveData(key: ApiKey.authorization, value:state.codeOtpResponse.data?.token);
          getIt<SharedPrefHelper>().saveData(key: ApiKey.phone, value:state.codeOtpResponse.data?.user?.mobile);
          getIt<SharedPrefHelper>().saveData(key: ApiKey.name, value:state.codeOtpResponse.data?.user?.name);
          context.pushNamedAndRemoveUntil(Routes.changePassword,predicate:(route) => false,);
        } else if (state is Error) {
          toast(text:state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
