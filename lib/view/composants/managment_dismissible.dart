import 'package:flutter/material.dart';

class ManagmentDismissible
{
  static AlertDialog alertDialogDismissibleDelete(BuildContext context, int index,String title, String content, String choice1, String choice2,List<Widget> list)
  {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: (){
              setState((){
                list.removeAt(index);
              });
              Navigator.of(context).pop(true);
            },
            child: Text(choice1,style: TextStyle(color: Colors.red),)
        ),
        TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text(choice2,style: TextStyle(color: Colors.blue),)
        ),
      ],
    );
  }
}