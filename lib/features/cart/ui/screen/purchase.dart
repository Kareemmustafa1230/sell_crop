import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/purchase_cubit.dart';
import 'package:sell_your_crop/features/cart/ui/widget/purchase_screen.dart';

class Purchase extends StatelessWidget {
  const Purchase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PurchaseCubit>()..emitPurchaseState(),
      child: const PurchaseScreen(),
    );
  }
}
