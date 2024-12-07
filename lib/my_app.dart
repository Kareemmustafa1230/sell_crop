import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sell_your_crop/core/theme/Color/colors.dart';
import 'core/app_cubit/app_cubit.dart';
import 'core/app_cubit/app_state.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/language/app_localizations_setup.dart';
import 'core/networking/constants/api_constants.dart';
import 'core/networking/di/dependency_injection.dart';
import 'core/router/app_router.dart';
import 'core/router/routers.dart';

class SeelYourCrop extends StatelessWidget {
  final AppRouter appRouter;
  const SeelYourCrop({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>()..getSavedLanguage(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
            return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: getIt<SharedPrefHelper>().getData(key: ApiKey.authorization) != null
                ? Routes.home
                : Routes.onboarding,
            locale: Locale(context.read<AppCubit>().languageCode),
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
            theme: ThemeData(
            primaryColor:ColorApp.whiteFF,
            ),
            );
            },
          );
        },
      ),
    );
  }
}

