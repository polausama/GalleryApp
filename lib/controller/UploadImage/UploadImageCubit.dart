import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/WebServices/WebServices.dart';
import 'package:flutter_app/controller/UploadImage/UploadImageState.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/UploadImageScreen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(InitUploadImageState());
  static UploadImageCubit get(context) => BlocProvider.of(context);
  User user = User();
  List<File> images = [];
  getprofileuser(User newuser) {
    user = newuser;
    emit(InitUploadImageState());
  }

  Future<void> getimage({required ImageSource source}) async {
    XFile? picker = await ImagePicker().pickImage(source: source);
    if (picker != null) {
      var file = await ImageCropper().cropImage(
          sourcePath: picker.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
      images.add(File(file!.path));
      log("FilePath: ${file.path}");
    } else {
      log('No image selected.');
    }
    emit(InitUploadImageState());
  }
}
