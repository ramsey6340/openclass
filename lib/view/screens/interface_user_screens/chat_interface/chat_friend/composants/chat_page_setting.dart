import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../../data/data_current.dart';

class ChatPageSetting extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(current_friend.imgProfile!),
                  radius: 35,
                ),
                SizedBox(height: 10,),
                Text("${current_friend.firstName} ${current_friend.lastName}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text(current_friend.telNumber!, textAlign: TextAlign.center,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 5,
                ),
                SizedBox(width: 5,),
                Text("en lignes"),
              ],
            ),
            Divider(color: Colors.white, thickness: 0.5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    color: kColorSearch,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5)
                    )
                  ),
                  child: Column(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,size: 32,)),
                      Text("muet", textAlign: TextAlign.center,)
                    ],
                  ),
                )
              ],
            ),
            Divider(color: Colors.white, thickness: 0.5,),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: kColorSearch,
                borderRadius: BorderRadius.all(
                  Radius.circular(5)
                )
              ),
              child: Column(
                children: [
                  GestureDetector(
                    child: Text("Bloquer le contact", style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                    onTap: (){},
                  ),
                  Divider(color: Colors.white, thickness: 0.3,),
                  GestureDetector(
                    child: Text("Supprimer le contact", style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                    onTap: (){},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
