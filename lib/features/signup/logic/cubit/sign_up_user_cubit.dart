import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:sell_your_crop/core/helpers/shared_pref_helper.dart';
import 'package:sell_your_crop/core/networking/constants/api_constants.dart';
import 'package:sell_your_crop/features/signup/logic/cubit/sign_up_user_state.dart';
import '../../../../core/networking/di/dependency_injection.dart';
import '../../data/model/sign_up_user_request.dart';
import '../../data/repo/sign_up_repo.dart';


class SignUpUserCubit extends Cubit<SignupState> {
  final SignUpRepo _loginRepo;
  SignUpUserCubit(this._loginRepo) : super(const SignupState.initial());
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates({required String job}) async {
    emit(const SignupState.loading());
    final response = await _loginRepo.signup(
      SignUpUserRequest(
        name: nameController.text,
        mobile:mobileController.text ,
        password: passwordController.text,
        job: job,
      ),
    );
    await response.when(
        success: (response) async{
      //final token = response.data?.token;
     // await getIt<SharedPrefHelper>().saveData(key: ApiKey.authorization, value: token);
      emit(SignupState.success(message: response.msg!));
    }, failure: (error) {
      emit(SignupState.error(error: error.apiErrorModel.msg));
    });
  }
}

