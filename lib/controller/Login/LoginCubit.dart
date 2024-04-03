import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/WebServices/WebServices.dart';
import 'package:flutter_app/controller/Login/LoginState.dart';
import 'package:flutter_app/controller/UploadImage/UploadImageCubit.dart';
import 'package:flutter_app/local/sharedprefreince.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/UploadImageScreen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  String? email;
  String? pass;

  WebServices webServices = WebServices();
  User user = User();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit() : super(InitLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> onLogin(BuildContext context) async {
    bool valid = formKey.currentState!.validate();
    if (valid) {
      formKey.currentState!.save();
      var map = await webServices.login(email, pass);
      if (map["error_message"] != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid Credntials'),
            backgroundColor: Colors.red,
          ),
        );
        emit(FailLoginState());
      } else {
        user = User.fromjson(map['user']);
await Cache.settoken(map['token']);
        ///Save token in chared per
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => UploadImageCubit()..getprofileuser(user),
                      child: UploadImageScreen(),
                    )));
        emit(SuccessLoginState());
      }
    }
  }
}
