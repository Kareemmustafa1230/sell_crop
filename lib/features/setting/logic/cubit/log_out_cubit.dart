import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/repo/log_out_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/log_out_state.dart';


class LogOutCubit extends Cubit<LogOutState> {
  final LogOutRepo _logOutRepo;

  LogOutCubit(this._logOutRepo) : super(const LogOutState.initial());

  Future<void> emitLogOutState() async {
    emit(const LogOutState.loading());
    final resendOtpResponse = await _logOutRepo.logout();
    await resendOtpResponse.when(
      success: (response) async {
        emit(LogOutState.success(message: response.msg!));
      },
      failure: (error) {
        emit(LogOutState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}

