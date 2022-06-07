import 'package:flutter/material.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  @override
  build(BuildContext context)
  {
    Icon? suffixIconCross;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Text("Rejoindre une classe", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Text("Entrer un lien d'invitation ci-dessous pour rejoindre une classe existante.", textAlign: TextAlign.center,),
          SizedBox(height: 30),
          Text("Lien d'invitation", style: TextStyle(fontSize: 18),),
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: kColorSearch,
              suffixIcon: suffixIconCross,
            ),
          ),
          SizedBox(height: 20,),
          Text("Exemple:", style: TextStyle(fontSize: 18),),
          Text("Les liens d’invitation devraient ressembler à …"),
          SizedBox(height: 100,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NextButton(color: kColorPrimary, text: 'Créer une classe', press: (){}),
          ),
        ],
      ),
    );
  }
}