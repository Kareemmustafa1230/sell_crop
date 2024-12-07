import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/technical_support_request.dart';
import 'package:sell_your_crop/features/setting/data/repo/technical_support_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/technical_support_state.dart';


class TechnicalSupportCubit extends Cubit<TechnicalSupportState> {
  final TechnicalSupportRepo _technicalSupportRepo;
  TextEditingController phoneController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();


  final formKey = GlobalKey<FormState>();
  TechnicalSupportCubit(this._technicalSupportRepo) : super(const TechnicalSupportState.initial());

  Future<void> emitTechnicalSupportState() async {
    emit(const TechnicalSupportState.loading());
    final resendOtpResponse = await _technicalSupportRepo.technicalSupport(
      TechnicalSupportRequest(
          phone: phoneController.text,
          msg: msgController.text,
          name: nameController.text,
          subject: subjectController.text
      )
    );
    await resendOtpResponse.when(
      success: (response) async {
        emit(TechnicalSupportState.success(message: response.msg!));
      },
      failure: (error) {
        emit(TechnicalSupportState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}

