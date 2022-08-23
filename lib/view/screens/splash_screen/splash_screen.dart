import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openclass/CRUD/read.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'package:openclass/view/screens/login_screens/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
/*
  Read read = Read();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(FirebaseAuth.instance.currentUser?.uid != null){
      read.initCurrentUser(FirebaseAuth.instance.currentUser?.uid);
    }
  }

 */

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
      //navigator: (FirebaseAuth.instance.currentUser?.uid != null)?MainScreen():WelcomePage(),
      navigator: WelcomePage(),
    );
  }
}