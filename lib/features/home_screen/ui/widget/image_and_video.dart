import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell_your_crop/features/home_screen/logic/cubit/selling_store_cubit.dart';
import 'package:sell_your_crop/features/home_screen/ui/widget/picture_image_or_video.dart';

class ImageAndVideo extends StatelessWidget {
  const ImageAndVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SellingStoreCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PictureImageOrVideo(onTap: () async{
          final picker = ImagePicker();
          final pickedImages = await picker.pickMultiImage(); // استخدم pickMultiImage

          if (pickedImages != null) {
            cubit.addImages(pickedImages);
          }
        },
        icon: const Icon(CupertinoIcons.photo,size: 30,)),
        SizedBox(width: 75.w,),
        PictureImageOrVideo(onTap: () async {
            await context.read<SellingStoreCubit>().pickVideo();
        }, icon: const Icon(CupertinoIcons.videocam_fill,size: 30,)),
      ],
    );
  }
}
