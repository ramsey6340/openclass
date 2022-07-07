import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'package:openclass/view/screens/login_screens/forgot_password/forgot_password_page.dart';
import '../../../../composants/entry_field.dart';
import '../../../../composants/external_link.dart';
import '../../../../composants/next_button.dart';
import '../../../../constante.dart';

class SignInForm extends StatefulWidget
{
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>
{
  final _formKey = GlobalKey<FormState>();
  final entryField = EntryField();
  @override
  Widget build(BuildContext context) {
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
              press: (){
                /*
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Traitement des données ...',style: TextStyle(color: Colors.white),)),
                  );
                }
                 */
                Navigator.pushNamed(context, MainScreen.routeName);
                /*
                return showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Alert Message"),
                        content: Text(entryField.emailController.text+"\n"+entryField.passwordController.text),
                        actions: [
                          TextButton(onPressed: (){Navigator.of(context).pop(context);}, child: Text("OK"))
                        ],
                      );
                    }
                );
                 */
              }
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
        ],
      ),
    );
  }
}