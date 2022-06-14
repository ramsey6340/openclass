import 'package:flutter/material.dart';

import '../../../../../composants/entry_field.dart';
import '../../../../../constante.dart';

class BodyDiscussion extends StatefulWidget
{
  @override
  State<BodyDiscussion> createState() => _BodyDiscussion();
}

class _BodyDiscussion extends State<BodyDiscussion>
{
  bool privateSalle = false;
  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: kColorAppBar,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Nom de la salle", style: TextStyle(fontSize: 18),),
                EntryField.buildTextFiel(),
              ],
            ),
            SizedBox(height: 40,),
            Column(
              children: [
                Container(
                  color: kColorSearch,
                  child: ListTile(
                    leading: Icon(Icons.lock, color: Colors.white,),
                    title: Text("Salle privé", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    trailing: Switch(
                      activeColor: Colors.green,
                      value: privateSalle,
                      onChanged: (value){
                        setState((){
                          privateSalle = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text("En définissant une salle comme « privé », seuls les membres sélectionnés peuvent le voir"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}