import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../composants/next_button.dart';
import '../../../../constante.dart';
import '../../../interface_user_screens/main_screen.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundConfig,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.10),
            Text("Félicitation",style: headerFontSize,textAlign: headerTextAlign,),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Text("Vous faite desormais partie de OpenClass",style: subHeaderFontSize,textAlign: subHeaderTextAlign,),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Image.asset('assets/images/success.png'),
            SizedBox(height: MediaQuery.of(context).size.height*0.10,),
            NextButton(color: kColorPrimary, text: 'continuer', press: (){Navigator.pushNamed(context, MainScreen.routeName);}),
          ],
        ),
      ),
    );
  }
}