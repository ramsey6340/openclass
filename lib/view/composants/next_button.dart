import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget qui permet de créer le boutton qu'on a beaucoup utiliser dans l'inscription et la connexion
/// C'est le boutton qu'on utilise aussi pour valider une entrée de donnée, comme par exemple lorsque j'entre le nom de la classe

class NextButton extends StatelessWidget
{
  NextButton({Key ? key,  required this.color,required this.text, required this.press}):super(key: key);

  final String text;
  Function press;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width*0.7,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          child: Text(text, style: const TextStyle(fontSize: 20),),
          onPressed: press as void Function()?,
        ),
      );
  }
}