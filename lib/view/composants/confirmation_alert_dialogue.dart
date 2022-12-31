import 'package:flutter/material.dart';
import '../constante.dart';

/// Widget qui affiche un pop-pop à l'utilisateur lui demandant de confirmer ou annuler une action précise
/// Le pop-pop contient un message qui décrit à l'utilisateur l'action qui s'apprête à effectuer
/// L'utilisateur doit indiquer si oui ou non il souhaite poursuivre son action
/// Par exemple, lui demander s'il souhaite vraiment se déconnecté ou non

class ConfirmationAlertDialog extends StatelessWidget {
  const ConfirmationAlertDialog({Key? key, required this.message, required this.title, required this.action, required this.press}) : super(key: key);
  final String title;
  final String message;
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
            child: const Text("Annuler", style: TextStyle(color: Colors.white),)
        ),
        TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: press as void Function(),
            child: Text(action, style: const TextStyle(color: Colors.white),)
        )
      ],
    );
  }
}
