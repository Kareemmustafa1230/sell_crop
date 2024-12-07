import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/networking/di/dependency_injection.dart';
import 'core/router/app_router.dart';
import 'my_app.dart';

void main() async{
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await getIt<SharedPrefHelper >().init();
  Bloc.observer = AppBlocObserver();
  getIt<SharedPrefHelper >().getData(key: 'token') as String?;
  WidgetsFlutterBinding.ensureInitialized();

  runApp( SeelYourCrop(appRouter: AppRouter(),));
}


