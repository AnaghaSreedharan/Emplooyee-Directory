import 'dart:async';
import 'dart:io';
import 'package:employee_app/Resource/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../Home/Home.dart';




class Splash extends StatefulWidget {
  static String routeName = "/splash";

  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {


  @override
  void initState() {
    super.initState();
    startTime();
  }



  startTime() async {
      Timer(Duration(seconds: 3),
              () =>
              Navigator.pushNamedAndRemoveUntil(
                  context, Home.routeName, (route) => false)
      );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Sizer(builder: (context, orientation, deviceType) {
      return  Scaffold(
        backgroundColor: colorPrimaryDark,
        body:  Center(child:
        Container(
          alignment: Alignment.center,
          child: const Text("Employee Directory"),
        ),
        ),
      );
    });
  }
}
