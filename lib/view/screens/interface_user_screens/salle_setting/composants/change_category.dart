import 'package:flutter/material.dart';

import '../../../../composants/tools_bar.dart';
import '../../../../constante.dart';

class ChangeCategory extends StatefulWidget
{
  static String routeName = '/change_category';
  @override
  State<ChangeCategory> createState() => _ChangeCategoryState();
}

class _ChangeCategoryState extends State<ChangeCategory>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorComposant,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: ToolsBar.falseAppBar(
                Text('Annuler'),
                'Parametre de la salle',
                Text(''),
                    (){
                  Navigator.of(context).pop();
                },
                    (){}
            ),
          ),
          Expanded(
            child: Container(
              color: kColorAppBar,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ListView(
                  children: <Widget>[

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}