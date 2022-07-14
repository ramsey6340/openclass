import 'package:flutter/material.dart';

import '../constante.dart';

class SendMessageBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: kColorAppBar,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.image, size: 30, color: Colors.grey,)),
          Expanded(
            child: Container(
              height: 40,
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey,),
                  filled: true,
                  fillColor: kColorComposant,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.send, size: 30, color: kColorPrimary,)),
        ],
      ),
    );
  }
}