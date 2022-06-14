import 'package:flutter/material.dart';

import '../../../../../constante.dart';

class Contact extends StatelessWidget
{
  Contact({Key? key, required this.imgContact, required this.nameContact, required this.action}):super(key: key);
  final String imgContact;
  final String nameContact;
  final String action;
  @override
  build(BuildContext context)
  {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imgContact),
        radius: 15,
      ),
      title: Text(nameContact, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
      trailing: ElevatedButton(
        child: Text(action),
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
        ),
      ),
    );
  }
}