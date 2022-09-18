import 'dart:async';
import 'package:employee_app/Resource/Strings.dart';
import 'package:employee_app/Resource/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Home/Home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    Timer(
        const Duration(seconds: 2),
            () => Navigator.pushNamedAndRemoveUntil(
            context, Home.routeName, (route) => false));
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: const Text(
            Strings.appName,
            style: TextStyle(
                fontFamily: "Poppins-Bold",
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
