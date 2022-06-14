import 'package:flutter/material.dart';

class HeaderInvitationSheet extends StatelessWidget
{
  @override
  build(BuildContext context)
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text("Inviter un ami",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          SizedBox(height: 20,)
        ],
      ),
    );

  }
}