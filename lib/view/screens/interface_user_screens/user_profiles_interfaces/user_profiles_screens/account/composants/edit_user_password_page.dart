import 'package:flutter/material.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

class EditUserPasswordPage extends StatelessWidget {
  const EditUserPasswordPage({Key? key}) : super(key: key);
  static String routeName = '/edit_user_password_page';

  @override
  Widget build(BuildContext context) {
    EntryField entryField = EntryField();
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text("Annuler"),
          'Mon mot de passe',
          Text(""),
              (){Navigator.of(context).pop();},
              (){}
      ),
      body:  Container(
        color: kColorComposant,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text("Nouveau mot de passe", style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              entryField.buildPasswordField(),
              SizedBox(height: 10,),
              entryField.buildConfirmPasswordField(),
              SizedBox(height: 50,),
              NextButton(
                  color: kColorPrimary,
                  text: 'Enregistrer',
                  press: (){}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
