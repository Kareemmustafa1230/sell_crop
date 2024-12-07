import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell_your_crop/features/setting/data/model/request_model/complaint_request.dart';
import 'package:sell_your_crop/features/setting/data/repo/complaint_repo.dart';
import 'package:sell_your_crop/features/setting/logic/state_cubit/complaint_state.dart';


class ComplaintCubit extends Cubit<ComplaintState> {
  final ComplaintRepo _complaintRepo;
  TextEditingController phoneController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  ComplaintCubit(this._complaintRepo) : super(const ComplaintState.initial());

  Future<void> emitComplaintState() async {
    emit(const ComplaintState.loading());
    final resendOtpResponse = await _complaintRepo.complain(
      ComplaintRequest(
          phone: phoneController.text,
          msg: msgController.text,
          name: nameController.text
      )
    );
    await resendOtpResponse.when(
      success: (response) async {
        emit(ComplaintState.success(message: response.msg!));
      },
      failure: (error) {
        emit(ComplaintState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}

