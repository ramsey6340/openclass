import 'package:flutter/material.dart';
import 'composants/body.dart';
import '../../../constante.dart';

class ForgotPasswordPage extends StatelessWidget
{
  static String routeName = '/forgot_password_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: appBarConfig,
        backgroundColor: Colors.transparent,
      ),
      body: Body(),
    );
  }
}