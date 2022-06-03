import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'composants/body.dart';
import '../../../constante.dart';

class SignUpPage extends StatelessWidget
{
  static String routeName = '/sign_up_page';

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