import 'package:flutter/material.dart';
import 'package:openclass/CRUD/update.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/composants/alert_dialogue.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../../../controller/user_ctrl.dart';
import '../body_account.dart';

class EditUserPasswordPage extends StatefulWidget
{
  @override
  State<EditUserPasswordPage> createState() => _EditUserPasswordPageState();
  static String routeName = '/edit_user_password_page';
}

class _EditUserPasswordPageState extends State<EditUserPasswordPage> {
  EntryField entryField = EntryField();
  Update update = Update();
  UserCtrl userCtrl = UserCtrl();
  @override
  Widget build(BuildContext context) {
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
                  press: updatePassword
              ),
            ],
          ),
        ),
      ),
    );
  }

  // methode de mise à jour du mode de passe
  void updatePassword()
  {
    Map<String,String> new_value = Map();
    if(entryField.passwordController.text.isNotEmpty && entryField.confirmPasswordController.text.isNotEmpty){
      if(entryField.passwordController.text == entryField.confirmPasswordController.text){
        String password = entryField.passwordController.text;
        new_value = {"password":password};
        update.updateUserProfile(new_value);
        current_user.password = password;
        userCtrl.modifUser(current_user);
        Navigator.push(context, MaterialPageRoute(builder: (context) => BodyAccount()));
      }
      else{
        AlertDialogError(message: "Le mot de passe et la confirmation sont different");
      }
    }
  }
}
