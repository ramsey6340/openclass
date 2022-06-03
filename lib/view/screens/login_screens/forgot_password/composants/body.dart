import 'package:flutter/material.dart';

import '../../../../composants/external_link.dart';
import '../../../../constante.dart';
import '../../sign_up/sign_up_page.dart';
import 'forgot_form.dart';

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
              children: [
                Text("Mot de passe oublié",style: headerFontSize,textAlign: headerTextAlign,),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Text("Entrez votre email et nous vous enverrons un code pour permettre de réinitialiser votre mot de passe",style: subHeaderFontSize,textAlign: subHeaderTextAlign),
                SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                ForgotForm(),
                SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Vous n\'avez pas de compte ?', style: TextStyle(fontSize: 20),),
                    ExternalLink(color: kColorPrimarySecond, text: 'S\'inscrire', destination: SignUpPage.routeName),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}