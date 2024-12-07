import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/change_password_cubit.dart';
import 'package:sell_your_crop/features/forget_password/logic/cubit/change_password_state.dart';
import '../../../../core/router/routers.dart';
import '../../../../core/widget/toast.dart';

class ChangePasswordBlocListeners extends StatelessWidget {
  const ChangePasswordBlocListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          context.pushNamedAndRemoveUntil(Routes.home,predicate:(route) => false,);
        } else if (state is Error) {
          toast(text:state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
