import 'package:flutter/material.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/composants/otp_form.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/login_screens/reset_password/reset_password_page.dart';
import 'package:openclass/view/screens/login_screens/sign_up_success/sign_up_success_page.dart';

class ConfirmationForm extends StatefulWidget
{
  @override
  State<ConfirmationForm> createState() => _ConfirmationFormState();
}

class _ConfirmationFormState extends State<ConfirmationForm>
{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OtpForm(),
          SizedBox(height: MediaQuery.of(context).size.height*0.25,),
          NextButton(
              color: kColorPrimary,
              text: 'valider',
              press: (){
                Navigator.pushNamed(context, SignUpSuccessPage.routeName);
              }
          ),
        ],
      ),
    );
  }
}