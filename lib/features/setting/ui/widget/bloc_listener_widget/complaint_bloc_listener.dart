import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/complaint_cubit.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/complaint_state.dart';
import '../../../../../core/widget/toast.dart';

class ComplaintBlocListeners extends StatelessWidget {
  const ComplaintBlocListeners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ComplaintCubit,ComplaintState>(
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
