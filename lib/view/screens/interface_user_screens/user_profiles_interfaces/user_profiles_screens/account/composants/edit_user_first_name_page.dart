import 'package:flutter/material.dart';
import 'package:openclass/CRUD/update.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../../../controller/user_ctrl.dart';
import '../body_account.dart';

class EditUserFirstNamePage extends StatefulWidget
{
  @override
  State<EditUserFirstNamePage> createState() => _EditUserFirstNamePageState();
  static String routeName = '/edit_user_first_name_page';

}

class _EditUserFirstNamePageState extends State<EditUserFirstNamePage> {
  Update update = Update();
  EntryField entryField = EntryField();
  UserCtrl userCtrl = UserCtrl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text("Annuler"),
          'Mon Prénom',
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
              Text("Nouveau prénom", style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              entryField.buildPrenomField(),
              SizedBox(height: 50,),
              NextButton(
                  color: kColorPrimary,
                  text: 'Enregistrer',
                  press: updateFirstName,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // methode de mise à jour du prenom
  void updateFirstName()
  {
    Map<String,String> new_value = Map();
    if(entryField.firstNameController.text.isNotEmpty){
      String first_name = entryField.firstNameController.text;
      new_value = {"first_name":first_name};
      update.updateUserProfile(new_value);
      current_user.first_name = first_name;
      userCtrl.modifUser(current_user);
      Navigator.push(context, MaterialPageRoute(builder: (context) => BodyAccount()));
    }
  }
}
