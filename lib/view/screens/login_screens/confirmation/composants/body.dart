import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

import 'confirmation_form.dart';

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
                Text("Confirmation",style: headerFontSize,textAlign: headerTextAlign),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Text("Nous vous avons envoyer un code à 4 chiffres par email, veuillez entrer le code ici , il expirera dans ",style: subHeaderFontSize,textAlign: subHeaderTextAlign),
                optInput(30),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                ConfirmationForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //pour la durée de vie de l'OPT
  TweenAnimationBuilder optInput(int numSeconds)
  {
    return TweenAnimationBuilder(
      tween: Tween(begin: numSeconds, end: 0),
      duration: Duration(seconds: numSeconds),
      builder: (_, dynamic value, child) => Text(
        "00:${value.toInt()}",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
      onEnd: (){},
    );
  }
}