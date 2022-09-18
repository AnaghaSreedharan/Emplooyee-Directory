import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Resource/colors.dart';
import 'Screens/Home/Home.dart';
import 'Screens/Splash/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Register',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: colorPrimary,
        backgroundColor: Colors.white,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText2: const TextStyle(
            fontSize: 14.0,
          ),

          bodyText1: TextStyle(
            fontSize: 14.0,
            color: colorPrimary,
          ),
        ),
        primarySwatch: Colors.blue,

      ),
      initialRoute: Splash.routeName ,
      routes: {
        Splash.routeName: (context)=> Splash(),
        Home.routeName: (context)=> Home(),

      },
      navigatorObservers: <NavigatorObserver>[MyRouteObserver()],

      builder: EasyLoading.init(),
    );
  }
}
class MyRouteObserver extends RouteObserver {

  void saveLastRoute(String lastRoute) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('last_route', lastRoute);
  }
}

