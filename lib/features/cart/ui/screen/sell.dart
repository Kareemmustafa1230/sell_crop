import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/cart/ui/widget/sell_screen.dart';

import '../../../../core/networking/di/dependency_injection.dart';
import '../../logic/cubit/sell_cubit.dart';

class Sell extends StatelessWidget {
  static const String sell = "/sell";
  const Sell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SellCubit>()..emitSellState(),
        child: const SellScreen(),
    );
  }
}
