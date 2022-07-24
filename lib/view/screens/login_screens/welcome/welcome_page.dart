import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'composants/body.dart';

class WelcomePage extends StatelessWidget
{
  static String routeName = '/welcome_page';

  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}