import 'package:flutter/material.dart';
import '../constante.dart';

class AlertDialogError extends StatelessWidget {
  const AlertDialogError({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Erreur"),
      content: Text(message),
      contentTextStyle: const TextStyle(color: Colors.red),
      actions: [
        TextButton(
          style: TextButton.styleFrom(backgroundColor: kColorPrimary),
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("ok", style: TextStyle(color: Colors.white),)
        ),
      ],
    );
  }
}
