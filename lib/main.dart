import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/controller/Login/LoginCubit.dart';
import 'package:flutter_app/controller/UploadImage/UploadImageCubit.dart';
import 'package:flutter_app/local/sharedprefreince.dart';
import 'package:flutter_app/screens/UploadImageScreen.dart';
import 'package:flutter_app/screens/loginScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Cache.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: ScreenUtilInit(
        designSize: Size(428, 926),
        minTextAdapt: true,
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: 
            LoginScreen(),
            ),
      ),
    );
  }
}
