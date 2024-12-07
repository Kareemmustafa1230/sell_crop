import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';
import 'package:sell_your_crop/features/search/logic/cubit/search_cubit.dart';
import 'package:sell_your_crop/features/search/ui/widget/screen_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: const ScreenScreen(),
    );

  }
}
