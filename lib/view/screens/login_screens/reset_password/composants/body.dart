import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/login_screens/reset_password/composants/reset_password_form.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundConfig,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*0.10,),
                Text("Réinitialisation",style: headerFontSize,textAlign: headerTextAlign,),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Text("Veuillez choisir un nouveau mot de passe",style: subHeaderFontSize,textAlign: subHeaderTextAlign,),
                SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                ResetPasswordForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}