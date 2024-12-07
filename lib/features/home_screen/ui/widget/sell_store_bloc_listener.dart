import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/helpers/extensions.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_state.dart';
import 'package:sell_your_crop/features/home_screen/ui/screen/home.dart';
import '../../../../core/widget/toast.dart';

class SellStoreBlocListener extends StatelessWidget {
  const SellStoreBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SellingStoreCubit, SellingStoreState>(
      listener: (context, state) async {
        if (state is Success) {
          toast(text: state.message, color: Colors.green);
          context.pushWithTransition(screen:const HomePage());
        } else if (state is Error) {
          toast(text:state.error, color: Colors.red);
        } else if (state is Loading) {
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
