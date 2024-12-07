import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/constants/api_constants.dart';
import '../../../../core/networking/di/dependency_injection.dart';
import '../../data/model/login_request_body.dart';
import '../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


    Future<void> emitLoginState() async {
      emit(const LoginState.loading());
      final loginResponse = await _loginRepo.login(
        LoginRequestBody(
          mobile: mobileController.text,
          password: passwordController.text,
        ),
      );
      await loginResponse.when(
        success: (response) async {
          final token = response.data?.token;
          await getIt<SharedPrefHelper>().saveData(key: ApiKey.authorization, value: token);
          emit(LoginState.success(message: response.msg!));
        },
        failure: (error) {
          emit(LoginState.error(error: error.apiErrorModel.msg));
        },
      );
    }
  }

