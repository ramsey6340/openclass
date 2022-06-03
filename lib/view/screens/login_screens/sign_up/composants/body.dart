import 'package:flutter/material.dart';
import 'package:openclass/view/screens/login_screens/sign_up/composants/sign_up_form.dart';

import '../../../../constante.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundConfig,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Text("Inscription",style: headerFontSize,textAlign: headerTextAlign,),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Text("Veuillez remplir les champs",style: subHeaderFontSize,textAlign: subHeaderTextAlign,),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                SignUpForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}