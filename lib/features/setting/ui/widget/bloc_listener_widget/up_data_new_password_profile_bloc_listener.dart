import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/up_data_new_password_profile_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/up_data_new_password_profile_state.dart';
import '../../../../../core/widget/toast.dart';

class UpDataNewPasswordProfileBlocListener extends StatelessWidget {
  const UpDataNewPasswordProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpDataNewPasswordProfileCubit,UpDataNewPasswordProfileState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
        } else if (state is Error) {
          toast(text:state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
