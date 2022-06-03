import 'package:flutter/material.dart';
import 'package:openclass/routes.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/login_screens/welcome/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          //iconTheme:IconThemeData(color: Colors.black),
        ),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
      ),
      //home:,
      initialRoute: WelcomePage.routeName,
      routes: routes,
    );
  }
}

