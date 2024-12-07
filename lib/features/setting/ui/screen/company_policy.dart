import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/company_policy_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_screen/company_policy_screen.dart';

class CompanyPolicy extends StatelessWidget {
  const CompanyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => getIt<CompanyPolicyCubit>()..emitCompanyPolicyStates(),
      child: const CompanyPolicyScreen(),
    );
  }
}
