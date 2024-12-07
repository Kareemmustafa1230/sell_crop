import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/cities_cubit.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/sell_request_screen.dart';
import '../../../../core/networking/di/dependency_injection.dart';

class SellRequest extends StatelessWidget {
  const SellRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
      create: (context) => getIt<CitiesCubit>()..emitCitiesStates(),
    ),
    BlocProvider(
      create: (context) => getIt<SellingStoreCubit>(),
    ),
        ],
      child: const SellRequestScreen(),
    );
  }
}
