import 'package:flutter/material.dart';
import 'package:openclass/view/composants/external_link.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'composants/body.dart';
import '../../../composants/entry_field.dart';

class SignInPage extends StatelessWidget
{
  static String routeName = '/sign_in_page';
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