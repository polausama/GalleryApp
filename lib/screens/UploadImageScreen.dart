import 'package:flutter/material.dart';
import 'package:flutter_app/controller/UploadImage/UploadImageCubit.dart';
import 'package:flutter_app/controller/UploadImage/UploadImageState.dart';
import 'package:flutter_app/local/sharedprefreince.dart';
import 'package:flutter_app/screens/loginScreen.dart';
import 'package:flutter_app/widget/ContainerImage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background2.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25.w, right: 30.w, top: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         
                          "Welcome \n  ${UploadImageCubit.get(context).user.name!}",
                          style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        Image.asset(
                          "assets/images/Profile.png",
                          width: 56.w,
                          height: 56.h,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            Cache.removetoken();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()),) ;
                                                     },
                          icon: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.white,
                              // foregroundColor: Colors.white,
                              fixedSize: Size(142.w, 45.h)),
                          label: Text(
                            "log out",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                      TextButton.icon(
                          onPressed: () {
                            showDialog(
                              // barrierDismissible: false,
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor: Colors.white.withOpacity(0.5),
                                title: Column(children: [
                                  TextButton.icon(
                                      onPressed: () =>
                                          UploadImageCubit.get(context)
                                              .getimage(
                                                  source: ImageSource.gallery),
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.purple,
                                      ),
                                      style: TextButton.styleFrom(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              const Color.fromRGBO(239, 216, 249, 1),
                                          // foregroundColor: Colors.white,
                                          fixedSize: Size(184.w, 65.h)),
                                      label: Text(
                                        "Gallery",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 44.h,
                                  ),
                                  TextButton.icon(
                                      onPressed: () =>
                                          UploadImageCubit.get(context)
                                              .getimage(
                                                  source: ImageSource.camera),
                                      icon: const Icon(
                                        Icons.camera,
                                        color: Colors.purple,
                                      ),
                                      style: TextButton.styleFrom(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              const Color.fromRGBO(235, 246, 255, 1),
                                          // foregroundColor: Colors.white,
                                          fixedSize: Size(184.w, 65.h)),
                                      label: Text(
                                        "Camera",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ]),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.white,
                              // foregroundColor: Colors.white,
                              fixedSize: Size(142.w, 45.h)),
                          icon: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                              )),
                          label: Text(
                            "upload",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      itemCount: UploadImageCubit.get(context).images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 15.w,
                      ),
                      itemBuilder: (context, index) {
                        return ContainerImage(image: UploadImageCubit.get(context).images[index],);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
