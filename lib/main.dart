import 'package:flutter/material.dart';
import 'package:ibarra_portal/deudas_page.dart';
import 'package:ibarra_portal/home_page.dart';
import 'package:ibarra_portal/login_page.dart';
import 'package:ibarra_portal/predios_page.dart';
import 'package:ibarra_portal/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
        DeudasPage.id: (context) => DeudasPage(),
        PrediosPage.id: (context) => PrediosPage(),
      },
    );
  }
}
