import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constante.dart';

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
        width: 290,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          child: Text(text, style: TextStyle(fontSize: 20),),
          onPressed: press as void Function()?,
        ),
      );
  }
}