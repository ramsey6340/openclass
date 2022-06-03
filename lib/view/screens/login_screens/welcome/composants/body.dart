import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/screens/login_screens/sign_in/sign_in_page.dart';
import 'package:openclass/view/screens/login_screens/sign_up/sign_up_page.dart';

import '../../../../composants/next_button.dart';
import '../../../../constante.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundConfig,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,// permet à l'image de font de prendre toute la largeur de l'ecran
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.10,),
            Text(
              "OPENCLASS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            Text(
              "Bienvenue sur OpenClass",
              style: headerFontSize,textAlign: headerTextAlign,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Text(
              "Rejoignez nous pour faire évoluer notre manière d’étudier",
              style: subHeaderFontSize,textAlign: subHeaderTextAlign,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.10,),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NextButton(
                      color: kColorPrimary,
                      text: 'connexion',
                      press: (){
                        Navigator.pushNamed(context, SignInPage.routeName);
                      }
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                  NextButton(
                    color: kColorSecondary,
                    text: 's\'inscrire',
                    press: (){
                      Navigator.pushNamed(context, SignUpPage.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}