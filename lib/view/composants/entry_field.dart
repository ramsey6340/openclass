import 'package:flutter/material.dart';

import '../constante.dart';

class EntryField
{
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController multiTextController = TextEditingController();
  // champ de saisie pour le mot de passe
   Widget buildPasswordField()
   {
     return TextFormField(
       controller: passwordController,
       obscureText: true,
       validator: (value){
         if(value!.isEmpty || value==null){
           return kPassNullError;
         }
         return null;
       },
       style: TextStyle(color: Colors.white),
       decoration: InputDecoration(
         label: Text('Mot de passe', style: TextStyle(color: Colors.white),),
         filled: true,
         fillColor: kColorSecondary,
         //border: ,
       ),
     );
   }
   // champ de saisie pour la confirmation de mot de passe
   Widget buildConfirmPasswordField()
   {
     return TextFormField(
       controller: confirmPasswordController,
       obscureText: true,
       validator: (value){
         if(value!.isEmpty || value==null){
           return kPassNullError;
         }
         return null;
       },
       style: TextStyle(color: Colors.white),
       decoration: InputDecoration(
         label: Text('Confirmation de mot de passe', style: TextStyle(color: Colors.white),),
         filled: true,
         fillColor: kColorSecondary,
         //border: ,
       ),
     );
   }
 // champ de saisie pour l'email
  Widget buildEmailField()
  {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty || value ==null){
          return kEmailNullError;
        }
        else if(!emailValidatorRegExp.hasMatch(value)){
          return kInvalidEmailError;
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text('Email', style: TextStyle(color: Colors.white),),
        filled: true,
        fillColor: kColorSecondary,
      ),
    );
  }
  // champs de saisie de prenom
  Widget buildPrenomField()
  {
    return TextFormField(
      controller: firstNameController,
      keyboardType: TextInputType.text,
      validator: (value){
        if(value!.isEmpty || value == null){
          return kPrenomNullError;
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text('Prenom', style: TextStyle(color: Colors.white),),
        filled: true,
        fillColor: kColorSecondary,
      ),
    );
  }
   // champs de saisie de nom
   Widget buildNomField()
   {
     return TextFormField(
       controller: lastNameController,
       keyboardType: TextInputType.text,
       validator: (value){
         if(value!.isEmpty || value == null){
           return kNomNullError;
         }
         return null;
       },
       style: TextStyle(color: Colors.white),
       decoration: InputDecoration(
         label: Text('Nom', style: TextStyle(color: Colors.white),),
         filled: true,
         fillColor: kColorSecondary,
       ),
     );
   }
   // champs de saisie de numero
   Widget buildNumberField()
   {
     return TextFormField(
       controller: numberController,
       keyboardType: TextInputType.phone,
       validator: (value){
         if(value!.isEmpty || value == null){
           return kNumberNullError;
         }
         return null;
       },
       style: TextStyle(color: Colors.white),
       decoration: InputDecoration(
         label: Text('Numero', style: TextStyle(color: Colors.white),),
         filled: true,
         fillColor: kColorSecondary,
       ),
     );
   }

   // champs de saisi de text
    Widget buildTextField()
    {
      return TextField(
        controller: textController,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: kColorSearch,
        ),
      );
    }

 // champs de saisi multiligne
  Widget buildMultiTextField()
  {
    return TextField(
      controller: multiTextController,
      keyboardType: TextInputType.text,
      maxLines: 4,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: kColorSearch,
      ),
    );
  }
}