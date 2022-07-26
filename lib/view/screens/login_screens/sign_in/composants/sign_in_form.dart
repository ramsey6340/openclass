import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openclass/CRUD/read.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'package:openclass/view/screens/login_screens/forgot_password/forgot_password_page.dart';
import '../../../../composants/alert_dialogue.dart';
import '../../../../composants/entry_field.dart';
import '../../../../composants/external_link.dart';
import '../../../../composants/next_button.dart';
import '../../../../constante.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignInForm extends StatefulWidget
{
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>
{
  final _formKey = GlobalKey<FormState>();
  final entryField = EntryField();
  final read = Read();
  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          entryField.buildEmailField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildPasswordField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          ExternalLink(color: kColorForgotPassword, text: 'j\'ai oublié mon mot de passe', destination: ForgotPasswordPage.routeName),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          NextButton(
              color: kColorPrimary,
              text: 'connexion',
              press: signIn,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
        ],
      ),
    );
  }

  // methode de traitement de la connexion avec firebase
  Future <void> signIn() async
  {
    final formState = _formKey.currentState;
    if(formState!.validate()){
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: entryField.emailController.text, password: entryField.passwordController.text);
        read.initCurrentUser(credential.user?.uid);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainScreen()), (route) => false);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context){
                return AlertDialogError(message: "Email ou mot de passe incorrete !");
              }
          );
        } else if (e.code == 'wrong-password') {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context){
                return AlertDialogError(message: "Email ou mot de passe incorrete !");
              }
          );
        }
        print(e.toString());
      }
    }
  }

}