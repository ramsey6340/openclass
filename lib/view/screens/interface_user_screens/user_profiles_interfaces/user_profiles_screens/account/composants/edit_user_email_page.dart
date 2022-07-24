import 'package:flutter/material.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

class EditUserEmailNamePage extends StatelessWidget {
  const EditUserEmailNamePage({Key? key}) : super(key: key);
  static String routeName = '/edit_user_email_name_page';

  @override
  Widget build(BuildContext context) {
    EntryField entryField = EntryField();
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
                  press: (){}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
