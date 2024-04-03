import 'package:flutter/material.dart';
import 'package:flutter_app/controller/Login/LoginCubit.dart';
import 'package:flutter_app/widget/AppText.dart';
import 'package:flutter_app/widget/CustomTextForm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
      child: Form(
        key: LoginCubit.get(context).formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: 'MY \n Gellary',
                textAlign: TextAlign.center,
                fontsize: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.5)
                ),
                width: 345.w,
                height: 388.h,
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AppText(
                    text: 'LOG IN',
                    fontsize: 30.sp,
                  ),
                    SizedBox(height: 25.h,),
                    Custom_Text_Field(validator: (value) {
                      if(value!.isEmpty){
                        return 'enter your user name';
                      }
                      else if(!value.contains('@') && !value.contains('.com')){
                        return 'invaled email';
                      }
                      else return null;
                    },
                    hintName: 'User Name',
                      fontSize: 16.sp,
                      saved: (value) {
                        LoginCubit.get(context).email = value;
                      },),
                    SizedBox(height: 25.h,),
                    Custom_Text_Field(validator: (value) {
                       if(value!.isEmpty){
                            return 'enter your password';
                          }
                          else if(value.length < 8){
                            return 'weak password';
                          }
                          else return null;
                    },
                    hintName: 'Password',
                    ispass: true,
                      fontSize: 16.sp,
                      saved: (value) {
                        LoginCubit.get(context).pass = value;
                      },),
                    SizedBox(height: 25.h,),
                    SizedBox(width: 285.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(123, 179, 255, 1)),
                        onPressed: () {
                          LoginCubit.get(context).onLogin(context);
                        }, child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold),)),
                    )
                    ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
