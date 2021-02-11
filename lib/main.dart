import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:task1/Screen/Login.dart';
import 'package:task1/bloc/bloc.dart';
import 'package:task1/services/remote_services.dart';

import 'bloc/state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RemoteServices repository;
    return BlocProvider(
      create: (context)=>BlocIm(InitState(),repository,true),
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        allowFontScaling: false,
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login',
          theme: ThemeData(
            primarySwatch: Colors.blue,fontFamily: 'Raleway'
          ),
          home:Login(),
        ),
      ),
    );
  }
}


