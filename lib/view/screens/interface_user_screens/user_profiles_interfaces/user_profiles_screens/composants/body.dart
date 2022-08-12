import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/user.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/account/body_account.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/composants/photo_profile.dart';
import 'package:openclass/view/composants/interaction_next_component.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/setting_app/language.dart';
import 'package:openclass/view/screens/login_screens/welcome/welcome_page.dart';
import '../../../../../composants/confirmation_alert_dialogue.dart';
import '../../../../../constante.dart';
import '../profile/profile.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  /*
  List<Widget> listSettingUser = [
    InteractionComponent(
        title: "Compte",
        press: (){
        }
    ),
    InteractionComponent(title: "Profile d'utilisateur", press: (){}),
  ];
  List<Widget> listSettingAppli = [
    InteractionComponent(title: 'Langue', press: (){}),
    InteractionComponent(title: 'Notification', press: (){}),
  ];
*/
  UserModel? user = UserModel('','');


  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<UserModel?> getCurrentUser()
  async {
    final ref = db.collection("users").doc("Vj7fKPq9gfvR9DR9XkHa").withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel user, _) => user.toFirestore(),
    );
    final docSnap = await ref.get();
    user = docSnap.data(); // Convert to City object
    /*
    if (user != null) {
      return user;
    } else {
      return UserModel();
    }

     */
  }




  @override
  build(BuildContext context)
  {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              //PhotoProfile(imgProfile: currentUser.imgProfile, nameUser: currentUser.firstName+' '+currentUser.lastName, dateBirth: currentUser.dateBirth),
              PhotoProfile(imgProfile: current_user.imgProfile, nameUser: '${current_user.firstName} ${current_user.lastName}', dateBirth: current_user.dateBirth),
              SizedBox(height: 50,),
              Text("PARAMETRE DE L'UTILISATEUR"),
              InteractionComponent(
                  title: "Compte",
                  press: (){
                   Navigator.pushNamed(context, BodyAccount.routeName);
                  }
              ),
              Divider(color: Colors.white,height: 0,thickness:0.5),
              InteractionComponent(title: "Profile d'utilisateur", press: (){Navigator.pushNamed(context, Profile.routeName);}),
              SizedBox(height: 30,),
              Text("PARAMETRE DE L'APPLI"),
              InteractionComponent(title: "Langue", press: (){Navigator.pushNamed(context, Language.routeName);}),
              Divider(color: Colors.white,height: 0,thickness:0.5),
              //InteractionComponent(title: "Notification", press: (){}),
              SizedBox(height: 50,),
              Container(
                    height: 50,
                    color: kColorSearch,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text("Deconnexion", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                          onTap: (){
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context){
                                  return ConfirmationAlertDialog(
                                    title: 'Déconnexion',
                                    message: 'Voullez-vous vraiment vous déconnecté ?',
                                    action: 'Déconnexion',
                                    press: signOutUser,
                                  );
                                }
                            );
                          },
                        ),
                      ],
                    )
                ),
              SizedBox(height: 50,),
            ],
          ),
        ),
    );
  }

  // methode de deconnexion de l'utilisateur
  Future<void> signOutUser() async{
    await FirebaseAuth.instance.signOut();
    current_menu_index = 0;
    current_user_id = '';
    //Navigator.pushNamed(context, MainScreen.routeName);
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => new WelcomePage()
        ),
        (route) => false
    );
  }

}