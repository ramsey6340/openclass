import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

/// Widget pour crée un formulaire OTP

class OtpForm extends StatefulWidget
{
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}
class _OtpFormState extends State<OtpForm>
{
  FocusNode? pin2;
  FocusNode? pin3;
  FocusNode? pin4;

  @override
  void initState() {
    super.initState();
    pin2 = FocusNode();
    pin3 = FocusNode();
    pin4 = FocusNode();
  }

  @override
  void dispose() {
    pin2!.dispose();
    pin3!.dispose();
    pin4!.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focusNode})
  {
    if(value!.length == 1){
      focusNode!.requestFocus();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
          height: MediaQuery.of(context).size.height*0.15,
          decoration: const BoxDecoration(
            color: kColorSecondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.18,
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: kOtpInputDecoration,
                    onChanged: (value){
                      nextField(value: value, focusNode: pin2);
                    },
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.18,
                  child: TextFormField(
                    focusNode: pin2,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: kOtpInputDecoration,
                    onChanged: (value){
                      nextField(value: value, focusNode: pin3);
                    },
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.18,
                  child: TextFormField(
                    focusNode: pin3,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: kOtpInputDecoration,
                    onChanged: (value){
                      nextField(value: value, focusNode: pin4);
                    },
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.18,
                  child: TextFormField(
                    focusNode: pin4,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: kOtpInputDecoration,
                    onChanged: (value){
                      pin4!.unfocus();
                    },
                  ),
                ),
              ],
            ),
          )
        )
    );
  }
}