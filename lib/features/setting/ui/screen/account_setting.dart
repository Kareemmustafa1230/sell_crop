import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/get_profile_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_screen/account_setting_screen.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetProfileCubit>()..emitGetProfileStates(),
      child: const AccountSettingScreen(),
    );
  }
}
