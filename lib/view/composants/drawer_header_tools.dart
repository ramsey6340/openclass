import 'package:flutter/material.dart';

import 'invite_button.dart';

class DrawerHeaderTools extends StatelessWidget
{
  DrawerHeaderTools({Key? key, required this.nameClasse}):super(key: key);
  final String nameClasse;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(nameClasse,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
              GestureDetector(
                child: Icon(Icons.more_horiz,color: Colors.white,),
                onTap: (){},
              ),
            ],
          ),
          SizedBox(height: 50,),
          InviteButton(),
        ],
      ),
    );
  }
}