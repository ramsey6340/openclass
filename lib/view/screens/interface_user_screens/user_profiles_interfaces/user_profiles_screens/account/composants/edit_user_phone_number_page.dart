import 'package:flutter/material.dart';
import 'package:openclass/CRUD/update.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../../../controller/user_ctrl.dart';
import '../../../../../../../data/data_current.dart';
import '../body_account.dart';

class EditUserPhoneNumberPage extends StatefulWidget
{
  @override
  State<EditUserPhoneNumberPage> createState() => _EditUserPhoneNumberPageState();
  static String routeName = '/edit_user_phone_number_page';

}

class _EditUserPhoneNumberPageState extends State<EditUserPhoneNumberPage> {
  EntryField entryField = EntryField();
  Update update = Update();
  UserCtrl userCtrl = UserCtrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text("Annuler"),
          'Mon numero de téléphone',
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
              Text("Nouveau numero", style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              entryField.buildNumberField(),
              SizedBox(height: 50,),
              NextButton(
                  color: kColorPrimary,
                  text: 'Enregistrer',
                  press: updatePhoneNumber
              ),
            ],
          ),
        ),
      ),
    );
  }

  // methode de mise à jour le numero de téléphone
  void updatePhoneNumber()
  {
    Map<String,String> new_value = Map();
    if(entryField.numberController.text.isNotEmpty){
      String tel_number = entryField.numberController.text;
      new_value = {"tel_number":tel_number};
      update.updateUserProfile(new_value);
      current_user.tel_number = tel_number;
      userCtrl.modifUser(current_user);
      Navigator.push(context, MaterialPageRoute(builder: (context) => BodyAccount()));
    }
  }
}
