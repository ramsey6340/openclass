import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openclass/view/constante.dart';
import 'composants/body.dart';

class ConfirmationPage extends StatelessWidget
{
  static String routename = '/confirmation_page';
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