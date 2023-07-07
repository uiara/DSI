import 'package:flutter/material.dart';
import 'package:app_med_base2023/telas/home_page.dart';
import 'package:app_med_base2023/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage()
      },
    );
  }
}
