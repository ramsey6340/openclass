import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/login_screens/sign_in/sign_in_page.dart';

class ResetPasswordForm extends StatefulWidget
{
  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm>
{
  final _formKey = GlobalKey<FormState>();
  final entryField = EntryField();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          entryField.buildPasswordField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildConfirmPasswordField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.07,),
          NextButton(
              color: kColorPrimary,
              text: 'valider',
              press: (){
                Navigator.pushNamed(context, SignInPage.routeName);
              }
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.07,),
          NextButton(
              color: kColorCancel,
              text: 'annuler',
              press: (){
                Navigator.pushNamed(context, SignInPage.routeName);
              }
          ),
        ],
      ),
    );
  }
}