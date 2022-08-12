import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openclass/view/composants/alert_dialogue.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import '../../../../../CRUD/create.dart';
import '../../../../../CRUD/read.dart';
import '../../../../../data/data_current.dart';
import '../../../../../model/user.dart';
import '../../../../composants/external_link.dart';

class SignUpForm extends StatefulWidget
{
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>
{
  final _formKey = GlobalKey<FormState>();
  final entryField = EntryField();
  bool accepteCondition = false;
  final create = Create();
  final read = Read();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          entryField.buildPrenomField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildNomField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildEmailField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildNumberField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildPasswordField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildConfirmPasswordField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: kColorPrimary,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return kColorPrimary;
                    }
                    return kColorPrimary;
                  }),
                  value: accepteCondition,
                  onChanged: (bool? value){
                    setState(() {
                      accepteCondition = value!;
                    });
                  }
              ),
              Text("J'ai lu et j'accepte la politique",style: TextStyle(fontSize: 16),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExternalLink(color: kColorPrimarySecond, text: 'd\'utilisation', destination: ''),
              Text(" et de ",style: TextStyle(fontSize: 16),),
              ExternalLink(color: kColorPrimarySecond, text: 'confidentialité', destination: ''),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          NextButton(
              color: kColorPrimary,
              text: 'continuer',
              press: signUp,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
        ],
      ),
    );
  }

  // methode d'enregistrement de l'utilisateur
  Future <void> signUp() async
  {
    final formState = _formKey.currentState;
    if(entryField.passwordController.text == entryField.confirmPasswordController.text){
      if(accepteCondition){
        if(formState!.validate()){
          try {
            FirebaseFirestore db = FirebaseFirestore.instance;

            final user = UserModel(
              '',
              entryField.emailController.text,
              first_name: entryField.firstNameController.text,
              last_name: entryField.lastNameController.text,
              tel_number: entryField.numberController.text,
              img_profile: 'assets/images/img_default_person.png',
              password: entryField.passwordController.text,
              date_birth: '2000',
              date_creation: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
            );

            var credentialUp = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password!);
            user.idU = credentialUp.user?.uid as String;
            current_user_id = user.id;

            // enregistrement de l'utilisateur dans Firebase
            create.signUpUserInFirebase(user);
            // connexion de l'utilisateur à son compte
            final credentialIn = await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password!);

            read.initCurrentUser(credentialIn.user?.uid);
            current_menu_index = 0;
            // redirection de l'utilisateur vers la page d'accueil
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainScreen()), (route) => false);

          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('Le mot de passe fourni est trop faible.');
            } else if (e.code == 'email-already-in-use') {
              print('Un compte existe déjà pour cet e-mail.');
            }
          } catch (e) {
            print(e);
          }
        }
      }
      else{
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context){
              return AlertDialogError(message: "Veuillez accepter notre politique d'utilisation pour pouvoir continuer");
            }
        );
      }
    }
    else{
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context){
            return AlertDialogError(message: "Le mot de passe et la confirmation sont different !");
          }
      );
    }
  }

}
