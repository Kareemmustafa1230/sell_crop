import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/setting/logic/cubit/complaint_cubit.dart';
import 'package:sell_your_crop/features/setting/ui/widget/widget_screen/complaint_screen.dart';

class Complaints extends StatelessWidget {
  const Complaints({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ComplaintCubit>(),
      child: const ComplaintScreen(),
    );
  }
}
