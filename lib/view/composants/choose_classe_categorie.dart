import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

import '../../model/enum_type.dart';
import 'category_item.dart';

class ChooseClasseCategorie extends StatefulWidget
{
  @override
  State<ChooseClasseCategorie> createState() => _ChooseClasseCategorieState();
  EnumCategorySalle _categorySalle = EnumCategorySalle.discussion;

  // methode pour retourner le type de categorie choisie
  EnumCategorySalle get categoryChoose => _categorySalle;

}

class _ChooseClasseCategorieState extends State<ChooseClasseCategorie>
{
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
              leading: Icon(Icons.picture_in_picture, color: Colors.white,),
              radio: Radio(
                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                groupValue: widget._categorySalle,
                value: EnumCategorySalle.discussion,
                onChanged: (value){
                  setState((){
                    widget._categorySalle = value;
                  });
                },
              )
          ),
          Divider(color: Colors.white,height: 0,thickness: 0.3,),
          CategoryItem(
              title: "Bibliothèque",
              description: "Partager les documents pdf, docx etc.",
              leading: Icon(Icons.menu_book_rounded, color: Colors.white,),
              radio: Radio(
                activeColor: Color(0xFF3979d4),
                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                groupValue: widget._categorySalle,
                value: EnumCategorySalle.bibliotheque,
                onChanged: (value){
                  setState((){
                    widget._categorySalle = value;
                  });
                },
              )
          ),
          Divider(color: Colors.white,height: 0,thickness: 0.3,),
          CategoryItem(
              title: "Information",
              description: "Parteger les dernière nouvelle avec vos camarades",
              leading: Icon(Icons.info_outline_rounded, color: Colors.white,),
              radio: Radio(
                fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                activeColor: Color(0xFF3979d4),
                groupValue: widget._categorySalle,
                value: EnumCategorySalle.information,
                onChanged: (value){
                  setState((){
                    widget._categorySalle = value;
                  });
                },
              )
          )
        ],
      ),
    );
  }


}