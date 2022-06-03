import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../constante.dart';
import 'package:openclass/view/screens/login_screens/reset_password/composants/body.dart';

class ResetPasswordPage extends StatelessWidget
{
  static String routeName = '/reset_password_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Body(),
    );
  }
}