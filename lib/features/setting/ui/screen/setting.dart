import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/log_out_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_screen/setting_screen.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogOutCubit>(),
      child: const SettingScreen(),
    );
  }
}
