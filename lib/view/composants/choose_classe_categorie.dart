import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import '../../model/enum_type.dart';
import 'category_item.dart';

/// Widget qui permet d'afficher tous les catégories de classe disponible

class ChooseClasseCategorie extends StatefulWidget
{
  const ChooseClasseCategorie({Key? key}) : super(key: key);

  @override
  State<ChooseClasseCategorie> createState() => _ChooseClasseCategorieState();
  static String _categorySalle = EnumCategorySalle.discussion;

  // methode pour retourner le type de categorie choisie
  static String get categoryChoose => _categorySalle;

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
              leading: const Icon(Icons.picture_in_picture, color: Colors.white,),
              radio: Radio(
                fillColor: MaterialStateProperty.all(const Color(0xFF3979d4)),
                groupValue: ChooseClasseCategorie._categorySalle,
                value: EnumCategorySalle.discussion,
                onChanged: (value){
                  setState((){
                    ChooseClasseCategorie._categorySalle = value;
                  });
                },
              )
          ),
          const Divider(color: Colors.white,height: 0,thickness: 0.3,),
          CategoryItem(
              title: "Bibliothèque",
              description: "Partager les documents pdf, docx etc.",
              leading: const Icon(Icons.menu_book_rounded, color: Colors.white,),
              radio: Radio(
                activeColor: const Color(0xFF3979d4),
                fillColor: MaterialStateProperty.all(const Color(0xFF3979d4)),
                groupValue: ChooseClasseCategorie._categorySalle,
                value: EnumCategorySalle.bibliotheque,
                onChanged: (value){
                  setState((){
                    ChooseClasseCategorie._categorySalle = value;
                  });
                },
              )
          ),
          const Divider(color: Colors.white,height: 0,thickness: 0.3,),
          CategoryItem(
              title: "Information",
              description: "Parteger les dernière nouvelle avec vos camarades",
              leading: const Icon(Icons.info_outline_rounded, color: Colors.white,),
              radio: Radio(
                fillColor: MaterialStateProperty.all(const Color(0xFF3979d4)),
                activeColor: const Color(0xFF3979d4),
                groupValue: ChooseClasseCategorie._categorySalle,
                value: EnumCategorySalle.information,
                onChanged: (value){
                  setState((){
                    ChooseClasseCategorie._categorySalle = value;
                  });
                },
              )
          )
        ],
      ),
    );
  }


}