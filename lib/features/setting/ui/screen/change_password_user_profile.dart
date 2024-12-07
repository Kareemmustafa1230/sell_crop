import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/up_data_new_password_profile_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_screen/change_password_screen_user_profile.dart';

class ChangePasswordUserProfile extends StatelessWidget {
  const ChangePasswordUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpDataNewPasswordProfileCubit>(),
      child: const ChangePasswordScreenUserProfile(),
    );
  }
}
