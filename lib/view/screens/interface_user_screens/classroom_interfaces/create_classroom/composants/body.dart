import 'package:flutter/material.dart';
import 'package:openclass/view/composants/external_link.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_classroom/composants/choose_picture_class.dart';
import '../../../../../composants/entry_field.dart';
import 'choose_picture_class.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  bool _privateClassroom = false;
  @override
  build(BuildContext context)
  {
    Icon? suffixIconCross;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
        children: [
          Text("Créer une classe", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          SizedBox(height: 50,),
          ChoosePictureClass(imgClass: null),
          SizedBox(height: 50,),
          Text("Nom de la classe", style: TextStyle(fontSize: 18),),
          EntryField.buildTextFiel(),
          SizedBox(height: 20,),
          Container(
            color: kColorSearch,
            child: ListTile(
              leading: Icon(Icons.lock, color: Colors.white,),
              title: Text("Classe privé", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
              trailing: Switch(
                activeColor: Colors.green,
                value: _privateClassroom,
                onChanged: (value){
                  setState((){
                    _privateClassroom = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text("En définissant une classe comme « privé », seuls les personnes directement inviter par vous peuvent y acceder"),
          SizedBox(height: 20,),
          Row(
            children: [
              Text("En créant une classe, tu accepte la ", style: TextStyle(fontSize: 16),),
              ExternalLink(color: kColorPrimary, text: "Politique", destination: ''),
            ],
          ),
          ExternalLink(color: kColorPrimary, text: "d'utilisation de OpenClass", destination: ''),
          SizedBox(height: 80,),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 50),
            child: NextButton(color: kColorPrimary, text: 'Créer une classe', press: (){}),
          ),
        ],
      ),
    );
  }
}