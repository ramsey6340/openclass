import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constante.dart';
import 'composants/body.dart';

class WelcomePage extends StatelessWidget
{
  static String routeName = '/welcome_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}