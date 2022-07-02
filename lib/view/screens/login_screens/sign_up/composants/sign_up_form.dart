import 'package:flutter/material.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/login_screens/authentication/authentication_page.dart';
import 'package:openclass/view/screens/login_screens/confirmation/confirmation_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          entryField.buildPrenomFiel(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildNomFiel(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildEmailField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          entryField.buildNumberFiel(),
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
              press: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Traitement des données ...',style: TextStyle(color: Colors.white),)),
                  );
                }
                Navigator.pushNamed(context, ConfirmationPage.routename);
              }
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
        ],
      ),
    );
  }
}