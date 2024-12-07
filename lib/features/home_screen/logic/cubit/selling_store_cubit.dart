import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell_your_crop/core/widget/image_picker.dart';
import 'package:sell_your_crop/features/home_screen/data/model/selling_store_request.dart';
import 'package:sell_your_crop/features/home_screen/data/repo/selling_store_repo.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_state.dart';

class SellingStoreCubit extends Cubit<SellingStoreState> {
  final SellingStoreRepo _sellingStoreRepo;
  TextEditingController genreController = TextEditingController();
  int? cityId;
  String? target;
  List<XFile> img = []; // قائمة الصور
  XFile? video; // متغير الفيديو

  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SellingStoreCubit(this._sellingStoreRepo) : super(const SellingStoreState.initial());

  // دالة لتخزين الصور
  void addImages(List<XFile> newImages) {
    img = newImages; // إعادة تعيين الصور المختارة
    video = null; // إذا تم اختيار صور، قم بإلغاء الفيديو
  }

  // دالة لاختيار الفيديو
  Future<void> pickVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      video = pickedVideo; // تخزين الفيديو
      img.clear(); // إذا تم اختيار فيديو، قم بإلغاء الصور
      print('Selected Video Path: ${video!.path}');
    }
  }

  // دالة لإرسال البيانات
  Future<void> emitSellingStoreStates() async {
    emit(const SellingStoreState.loading());

    // تحقق من وجود صور أو فيديو
    if (img.isEmpty && video == null) {
      emit(SellingStoreState.error(error: "No images or video selected"));
      return;
    }

    final imagePaths = img.map((file) => file.path).toList() ?? [];
    final videoPath = video?.path ?? "";

    // بناء الكائن SellingStoreRequest
    final sellingStoreRequest = SellingStoreRequest(
      genre: genreController.text,
      target: target.toString(),
      quantity: quantityController.text,
      price: priceController.text,
      phone: phoneController.text,
      cityId: cityId.toString(),
      type: 'sell',
      img: imagePaths.isNotEmpty ? imagePaths : [], // اجعلها null إذا لم يكن هناك صور
      video: videoPath.isNotEmpty ? videoPath : '', // اجعلها null إذا لم يكن هناك فيديو
    );

    // إرسال الطلب
    final response = await _sellingStoreRepo.sellingStore(sellingStoreRequest);

    await response.when(
      success: (response) async {
        emit(SellingStoreState.success(message: response.msg!));
      },
      failure: (error) {
        emit(SellingStoreState.error(error: error.apiErrorModel.msg));
      },
    );
  }
}