import 'package:flutter/material.dart';

import '../constante.dart';

class EntryField
{
  // champ de saisie pour le mot de passe
   static Widget buildPasswordField()
   {
     return Container(
       color: Color(0xFF4F4949),
       child: TextFormField(
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
           //border: ,
         ),
       ),
     );
   }
   // champ de saisie pour la confirmation de mot de passe
   static Widget buildConfirmPasswordField()
   {
     return Container(
       color: Color(0xFF4F4949),
       child: TextFormField(
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
           //border: ,
         ),
       ),
     );
   }
 // champ de saisie pour l'email
  static Widget buildEmailField()
  {
    return Container(
      color: Color(0xFF4F4949),
      child: TextFormField(
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
        ),
      ),
    );
  }
  // champs de saisie de prenom
  static Widget buildPrenomFiel()
  {
    return Container(
      color: Color(0xFF4F4949),
      child: TextFormField(
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
        ),
      ),
    );
  }
   // champs de saisie de nom
   static Widget buildNomFiel()
   {
     return Container(
       color: Color(0xFF4F4949),
       child: TextFormField(
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
         ),
       ),
     );
   }
   // champs de saisie de numero
   static Widget buildNumberFiel()
   {
     return Container(
       color: Color(0xFF4F4949),
       child: TextFormField(
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
         ),
       ),
     );
   }
}