import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

class SearchBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            color: kColorSearch,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Rechercher',
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search,color: Colors.white,),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Divider(height: 3,color: Colors.white,)
      ],
    );
  }
}