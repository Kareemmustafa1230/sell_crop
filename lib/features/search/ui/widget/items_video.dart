import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sell_your_crop/features/cart/logic/cubit/sell_cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ItemsVideo extends StatefulWidget {
  const ItemsVideo({
    super.key,
    required this.videoUrl,
    required this.type,
    required this.quantity,
    required this.price,
    required this.date,
    required this.address,
    required this.listingId,
    required this.targetIf,
    required this.target,
  });

  final String videoUrl;
  final String type;
  final String quantity;
  final String price;
  final String date;
  final String address;
  final String listingId;
  final String targetIf;
  final String target;

  @override
  _ItemsVideoState createState() => _ItemsVideoState();
}

class _ItemsVideoState extends State<ItemsVideo> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: 5/ 5,
      autoInitialize: true,
      allowFullScreen: true,
      allowMuting: true,
      allowPlaybackSpeedChanging: true,
      showControls: true,
      showControlsOnInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:3.h,right: 8.w,left: 8.w),
      height: 480.h,
      width: 350.w,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1,
          color: Colors.green,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 5/ 5,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Text(widget.type),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                alignment: Alignment.center,
                width: 106.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    if (widget.targetIf == 'exportation' ||
                        widget.targetIf == 'تصدير') ...[
                      SvgPicture.asset(
                        'assets/svg/Subtract.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      const Spacer(),
                      Text(
                        widget.target,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ] else ...[
                      SvgPicture.asset(
                        'assets/svg/Shop.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      const Spacer(),
                      Text(
                        widget.target,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widget.quantity,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                widget.listingId,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            widget.price,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.address,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap:() {
                  context.read<SellCubit>().launchWhatsApp();
                },
              child:SvgPicture.asset('assets/svg/iOS.svg',
                height: 35.h,
                width: 35.w,
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }
}