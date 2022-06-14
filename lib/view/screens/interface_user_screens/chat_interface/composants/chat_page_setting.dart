import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import '../../../../../model/user.dart';

class ChatPageSetting extends StatelessWidget
{
  ChatPageSetting({Key? key, required this.user}):super(key: key);
  final User user;
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
                  backgroundImage: AssetImage(user.img_profile),
                  radius: 35,
                ),
                SizedBox(height: 10,),
                Text("${user.first_name} ${user.last_name}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text(user.tel_number, textAlign: TextAlign.center,),
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
