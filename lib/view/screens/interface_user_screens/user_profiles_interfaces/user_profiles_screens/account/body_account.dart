import 'package:flutter/material.dart';
import 'package:openclass/data/data_user.dart';
import 'package:openclass/view/composants/confirmation_alert_dialogue.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/account/composants/edit_user_email_page.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/account/composants/edit_user_first_name_page.dart';
import '../../../../../composants/interaction_next_component.dart';
import '../../../../../constante.dart';
import 'composants/edit_user_last_name_page.dart';
import 'composants/edit_user_password_page.dart';
import 'composants/edit_user_phone_number_page.dart';

class BodyAccount extends StatelessWidget {
  static String routeName = '/body_account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text("Retour"),
          'Compte',
          Text(""),
          (){Navigator.of(context).pop();},
          (){}
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: kColorComposant,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ListView(
                  children: [
                    SizedBox(height: 50,),
                    Text("Mes informations", style: TextStyle(fontSize: 18),),
                    InteractionComponent(title: currentUser.firstName!, press: (){Navigator.pushNamed(context, EditUserFirstNamePage.routeName);}),
                    SizedBox(height: 2,),
                    InteractionComponent(title: currentUser.lastName!, press: (){Navigator.pushNamed(context, EditUserLastNamePage.routeName);}),
                    SizedBox(height: 2,),
                    InteractionComponent(title: currentUser.email!, press: (){Navigator.pushNamed(context, EditUserEmailNamePage.routeName);}),
                    SizedBox(height: 2,),
                    InteractionComponent(title: currentUser.telNumber!, press: (){Navigator.pushNamed(context, EditUserPhoneNumberPage.routeName);}),
                    SizedBox(height: 2,),
                    InteractionComponent(title: 'Mot de passe', press: (){Navigator.pushNamed(context, EditUserPasswordPage.routeName);}),
                    SizedBox(height: 50,),
                    Container(
                        height: 50,
                        color: kColorSearch,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Text("Désactiver le compte", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                              onTap: (){
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context){
                                    return ConfirmationAlertDialog(
                                      title: 'Désactiver mon compte',
                                      message: 'En desactivant votre compte vous ne serrez plus joinllable par vos ami(e)s et vous ne pourrez plus accedez à vos classe.\nVous porrez toujour revenir en vous connectant à nouveau à votre compte',
                                      action: 'Désactiver',
                                      press: (){Navigator.of(context).pop();},
                                    );
                                  }
                                );
                              },
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 10,),
                    Container(
                        height: 50,
                        color: kColorSearch,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Text("Supprimer le compte", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                              onTap: (){
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context){
                                      return ConfirmationAlertDialog(
                                        title: 'Supprimer mon compte',
                                        message: 'Cette compte n\'existera plus et vous ne pourrez plus y avoir accès',
                                        action: 'Supprimer',
                                        press: (){Navigator.of(context).pop();},
                                      );
                                    }
                                );
                              },
                            ),
                          ],
                        )
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
