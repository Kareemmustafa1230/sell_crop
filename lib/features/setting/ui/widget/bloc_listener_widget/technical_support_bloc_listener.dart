import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/technical_support_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/technical_support_state.dart';
import '../../../../../core/widget/toast.dart';

class TechnicalSupportBlocListeners extends StatelessWidget {
  const TechnicalSupportBlocListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TechnicalSupportCubit,TechnicalSupportState>(
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
