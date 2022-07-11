import 'package:flutter/material.dart';
import 'package:openclass/data/data_current_classroom.dart';
import 'package:openclass/view/composants/category_item.dart';

import '../../../../composants/tools_bar.dart';
import '../../../../constante.dart';

class ChangeCategory extends StatefulWidget
{
  static String routeName = '/change_category';
  var initCategoy = data_current_salle.categorySalle;
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
                Text('Retour'),
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
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text(
                      "Passer de la catégorie "+widget.initCategoy.name+" à la catégorie ",
                      style: TextStyle(fontSize: 18,),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                        child: ListView.builder(
                          itemCount: data_current_list_categories_salle.length,
                          itemBuilder: (context, index){
                            //index = index-1;
                            var item = data_current_list_categories_salle[index];
                            return CategoryItem(
                              title: item.name,
                              description: '',
                              leading: null,
                              radio: Radio(
                                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                                groupValue: widget.initCategoy,
                                value: item,
                                onChanged: (value){
                                  setState((){
                                    widget.initCategoy = value;

                                  });
                                },
                              ),
                            );
                          },
                        ),
                    ),
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