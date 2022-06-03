import 'package:flutter/material.dart';

import '../constante.dart';

class InviteButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kColorSearch,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person_add),
            Text("  Inviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          ],
        ),
        onPressed: (){
          //Navigator.pushNamed(context, InvitationPage.routeName);
        },
      ),
    );
  }
}