import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

import '../../create_salle/composants/category_item.dart';

class ChooseClasseCategorie extends StatefulWidget
{
  @override
  State<ChooseClasseCategorie> createState() => _ChooseClasseCategorieState();
}
enum _choixCategorieSalle {discussion, bibliotheque, information}

class _ChooseClasseCategorieState extends State<ChooseClasseCategorie>
{
  _choixCategorieSalle? _categorieSalle = _choixCategorieSalle.discussion;
  @override
  build(BuildContext context)
  {
    return Container(
      color: kColorSearch,
      child: Column(
        children: [
          CategoryItem(
              title: "Discussion",
              description: "Discuter de vos cours, partager des images, etc",
              leading: Icons.picture_in_picture,
              radio: Radio(
               // activeColor: Color(0xFF3979d4),
                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                groupValue: _categorieSalle,
                value: _choixCategorieSalle.discussion,
                onChanged: (value){
                  setState((){
                    _categorieSalle = value;
                  });
                },
              )
          ),
          Divider(color: Colors.white,height: 0,thickness: 0.3,),
          CategoryItem(
              title: "Bibliothèque",
              description: "Partager les documents pdf, docx etc.",
              leading: Icons.menu_book_rounded,
              radio: Radio(
                activeColor: Color(0xFF3979d4),
                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                groupValue: _categorieSalle,
                value: _choixCategorieSalle.bibliotheque,
                onChanged: (value){
                  setState((){
                    _categorieSalle = value;
                  });
                },
              )
          ),
          Divider(color: Colors.white,height: 0,thickness: 0.3,),
          CategoryItem(
              title: "Information",
              description: "Parteger les dernière nouvelle avec vos camarades",
              leading: Icons.info_outline_rounded,
              radio: Radio(
                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                activeColor: Color(0xFF3979d4),
                groupValue: _categorieSalle,
                value: _choixCategorieSalle.information,
                onChanged: (value){
                  setState((){
                    _categorieSalle = value;
                  });
                },
              )
          )
        ],
      ),
    );
  }
}