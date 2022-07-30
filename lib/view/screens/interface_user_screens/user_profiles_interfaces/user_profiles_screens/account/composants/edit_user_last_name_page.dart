import 'package:flutter/material.dart';
import 'package:openclass/CRUD/update.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../../../controller/user_ctrl.dart';
import '../body_account.dart';

class EditUserLastNamePage extends StatefulWidget
{
  @override
  State<EditUserLastNamePage> createState() => _EditUserLastNamePageState();
  static String routeName = '/edit_user_last_name_page';

}

class _EditUserLastNamePageState extends State<EditUserLastNamePage> {

  EntryField entryField = EntryField();
  Update update = Update();
  UserCtrl userCtrl = UserCtrl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text("Annuler"),
          'Mon nom',
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
              Text("Nouveau nom", style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              entryField.buildNomField(),
              SizedBox(height: 50,),
              NextButton(
                  color: kColorPrimary,
                  text: 'Enregistrer',
                  press: updateLastName
              ),
            ],
          ),
        ),
      ),
    );
  }

  // methode de mise à jour du nom
  void updateLastName()
  {
    Map<String,String> new_value = Map();
    if(entryField.lastNameController.text.isNotEmpty){
      String last_name = entryField.lastNameController.text;
      new_value = {"last_name":last_name};
      update.updateUserProfile(new_value);
      current_user.last_name = last_name;
      userCtrl.modifUser(current_user);
      Navigator.push(context, MaterialPageRoute(builder: (context) => BodyAccount()));
    }
  }
}
