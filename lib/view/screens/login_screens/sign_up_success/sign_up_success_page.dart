import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'composants/body.dart';
import '../../../constante.dart';

class SignUpSuccessPage extends StatelessWidget
{
  static String routeName = '/sign_up_success_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}