import 'package:flutter/material.dart';
import 'package:CrudAgendaMed/telas/agendaMed.dart';
import 'package:CrudAgendaMed/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => TelaCadastro()
      },
    );
  }
}
