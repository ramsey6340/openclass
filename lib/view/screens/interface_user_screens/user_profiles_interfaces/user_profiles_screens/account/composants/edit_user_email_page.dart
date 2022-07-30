import 'package:flutter/material.dart';
import 'package:openclass/CRUD/update.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../../../controller/user_ctrl.dart';
import '../body_account.dart';

class EditUserEmailNamePage extends StatefulWidget
{
  @override
  State<EditUserEmailNamePage> createState() => _EditUserEmailNamePageState();
  static String routeName = '/edit_user_email_name_page';

}

class _EditUserEmailNamePageState extends State<EditUserEmailNamePage> {
  EntryField entryField = EntryField();
  Update update = Update();
  UserCtrl userCtrl = UserCtrl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text("Annuler"),
          'Mon email',
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
              Text("Nouveau email", style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              entryField.buildEmailField(),
              SizedBox(height: 50,),
              NextButton(
                  color: kColorPrimary,
                  text: 'Enregistrer',
                  press: updateEmail
              ),
            ],
          ),
        ),
      ),
    );
  }

  // methode de mise à jour l'email
  void updateEmail()
  {
    Map<String,String> new_value = Map();
    if(entryField.emailController.text.isNotEmpty){
      String email = entryField.emailController.text;
      new_value = {"email":email};
      update.updateUserProfile(new_value);
      current_user.email = email;
      userCtrl.modifUser(current_user);
      Navigator.push(context, MaterialPageRoute(builder: (context) => BodyAccount()));
    }
  }
}
