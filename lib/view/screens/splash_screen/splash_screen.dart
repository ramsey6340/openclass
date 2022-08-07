import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/login_screens/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/openclass_splash.png'),
      title: Text(
        "OpenClass",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: kColorComposant,
      showLoader: false,
      loaderColor: Colors.blue,
      durationInSeconds: 5,
      navigator: WelcomePage(),
    );
  }
}