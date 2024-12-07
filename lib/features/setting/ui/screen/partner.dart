import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/partner_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_screen/partner_screen.dart';

class Partner extends StatelessWidget {
  const Partner({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => getIt<PartnerCubit>()..emitPartnerStates(),
      child: const PartnerScreen(),
    );
  }
}
