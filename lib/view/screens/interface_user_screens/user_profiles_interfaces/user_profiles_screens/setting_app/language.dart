import 'package:flutter/material.dart';
import 'package:openclass/view/composants/category_item.dart';

import '../../../../../composants/tools_bar.dart';
import '../../../../../constante.dart';
enum languages {francais, english}

class Language extends StatefulWidget
{
  static String routeName = '/language';

  @override
  State<Language> createState() => _LanguageState();
}
class _LanguageState extends State<Language>
{
  static List list_languages = ["Français", "English"];
  var initlanguage = list_languages[0];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text("ok", style: TextStyle(fontSize: 18),),
          'Langue',
          Text(""),
          (){Navigator.of(context).pop();},
          (){}
      ),
      body: Container(
        color: kColorComposant,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Choisissez la nouvelle langue de l'appli", style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                //color: kColorAppBar,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Expanded(
                        child: ListView.builder(
                          itemCount: list_languages.length,
                          itemBuilder: (context, index){
                            var item = list_languages[index];
                            return CategoryItem(
                              title: item,
                              description: '',
                              leading: null,
                              radio: Radio(
                                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                                groupValue: initlanguage,
                                value: item,
                                onChanged: (value){
                                  setState((){
                                    initlanguage = value;
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
      ),
    );
  }
}