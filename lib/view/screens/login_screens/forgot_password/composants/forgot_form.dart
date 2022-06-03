import 'package:flutter/material.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';

import '../../authentication/authentication_page.dart';

class ForgotForm extends StatefulWidget
{
  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm>
{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EntryField.buildEmailField(),
          SizedBox(height: MediaQuery.of(context).size.height*0.07,),
          NextButton(
              color: kColorPrimary,
              text: 'valider',
              press: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Traitement des données ...',style: TextStyle(color: Colors.white),)),
                  );
                }
                Navigator.pushNamed(context, AuthenticationPage.routename);
              }
          ),
        ],
      ),
    );
  }
}