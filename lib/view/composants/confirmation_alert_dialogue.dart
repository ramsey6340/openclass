import 'package:flutter/material.dart';
import '../constante.dart';

class ConfirmationAlertDialog extends StatelessWidget {
  const ConfirmationAlertDialog({Key? key, required this.message, required this.title, required this.action, required this.press}) : super(key: key);
  final String message;
  final String title;
  final String action;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            style: TextButton.styleFrom(backgroundColor: kColorPrimary),
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("Annuler", style: TextStyle(color: Colors.white),)
        ),
        TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: press as void Function(),
            child: Text(action, style: TextStyle(color: Colors.white),)
        )
      ],
    );
  }
}
