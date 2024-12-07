import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/technical_support_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_screen/technical_support_screen.dart';

class TechnicalSupport extends StatelessWidget {
  const TechnicalSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TechnicalSupportCubit>(),
      child: const TechnicalSupportScreen(),
    );
  }
}
