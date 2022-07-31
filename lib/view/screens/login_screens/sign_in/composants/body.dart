import 'package:flutter/material.dart';
import 'package:openclass/view/screens/login_screens/sign_in/composants/sign_in_form.dart';
import 'package:openclass/view/screens/login_screens/sign_up/sign_up_page.dart';

import '../../../../composants/entry_field.dart';
import '../../../../composants/external_link.dart';
import '../../../../composants/next_button.dart';
import '../../../../constante.dart';

class Body extends StatelessWidget
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                Text("Content de te revoir", style: headerFontSize,textAlign: headerTextAlign,),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Text("Connecte toi avec ton email pour commencer l'aventure",style: subHeaderFontSize,textAlign: subHeaderTextAlign,),
                SizedBox(height: MediaQuery.of(context).size.height*0.10,),
                SignInForm(),//les champs de formulaire
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Vous n\'avez pas de compte ?', style: TextStyle(fontSize: 20),),
                    ExternalLink(color: kColorPrimarySecond, text: 'S\'inscrire', destination: SignUpPage.routeName),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05)
              ],
            ),
          ],
        ),
      ),
    );
  }
}