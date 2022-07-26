import 'package:flutter/material.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/data/data_current_classroom.dart';
import 'package:openclass/data/data_user.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/view/composants/external_link.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import '../../../../../../data/data_category_salle.dart';
import '../../../../../../data/data_classroom.dart';
import '../../../../../../data/data_responsible.dart';
import '../../../../../../data/data_salle.dart';
import '../../../../../../increment.dart';
import '../../../../../../model/classroom.dart';
import '../../../../../../model/enum_type.dart';
import '../../../../../../model/salle.dart';
import '../../add_friends/add_friends_page.dart';
import 'choose_picture_class.dart';
import '../../../../../composants/entry_field.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  Classroom classroom_create = Classroom();
  final entryField = EntryField();
  bool _privateClassroom = false;
  Create create = Create();
  @override
  build(BuildContext context)
  {
    Icon? suffixIconCross;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
        children: [
          Text("Créer une classe", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          SizedBox(height: 50,),
          ChoosePictureClass(imgClass: null),
          SizedBox(height: 50,),
          Text("Nom de la classe", style: TextStyle(fontSize: 18),),
          entryField.buildTextField(),
          SizedBox(height: 20,),
          Text("Description de la classe", style: TextStyle(fontSize: 18),),
          entryField.buildMultiTextField(),
          SizedBox(height: 20,),
          Container(
            color: kColorSearch,
            child: ListTile(
              leading: Icon(Icons.lock, color: Colors.white,),
              title: Text("Classe privé", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
              trailing: Switch(
                activeColor: Colors.green,
                value: _privateClassroom,
                onChanged: (value){
                  setState((){
                    _privateClassroom = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text("En définissant une classe comme « privé », seuls les personnes directement inviter par vous peuvent y acceder"),
          SizedBox(height: 20,),
          Row(
            children: [
              Text("En créant une classe, tu accepte la ", style: TextStyle(fontSize: 16),),
              ExternalLink(color: kColorPrimary, text: "Politique", destination: ''),
            ],
          ),
          ExternalLink(color: kColorPrimary, text: "d'utilisation de OpenClass", destination: ''),
          SizedBox(height: 80,),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 50),
            child: NextButton(
                color: kColorPrimary,
                text: 'Créer une classe',
                press: creationOfClassroom,
            ),
          ),
        ],
      ),
    );
  }


  // methode de creation d'une classe
  void creationOfClassroom()
  {
    try{
      // l'instance de la classe
      final classroom = Classroom(
        id_classroom: '',
        name_classroom: entryField.textController.text,
        img_profile: '',
        creation_date: '',
        description_classroom: entryField.multiTextController.text,
        is_private: _privateClassroom,
        responsible_id: currentUser.id,
      );

      // création de la classe dans Firebase
      create.creationClassroom(classroom);

      // les instances des trois catégories de base
      final categorySalleInfo = CategorySalle(id_category:'', name_category:'SALLES INFORMATION', creation_date:'', description_category:'Salle de catégorie information', is_private:false, type_category:EnumCategorySalle.information, classroom_id:current_classroom_id);
      final categorySalleDoc = CategorySalle(id_category:'', name_category:'SALLES BIBLIOTHEQUE', creation_date:'', description_category:'Salle de catégorie document', is_private:false, type_category:EnumCategorySalle.bibliotheque, classroom_id:current_classroom_id);
      final categorySalleDis = CategorySalle(id_category:'', name_category:'SALLES DISCUSSION', creation_date:'', description_category:'Salle de catégorie discussion', is_private:false, type_category:EnumCategorySalle.discussion, classroom_id:current_classroom_id);

      // création des trois catégories de base dans Firebase
      create.creationCategorySalle(categorySalleInfo);
      create.creationCategorySalle(categorySalleDoc);
      create.creationCategorySalle(categorySalleDis);

      // les instances des trois salles
      final salleInfo = Salle(id_salle: '', name_salle: 'géneral', creation_date: '', is_private: false, category_salle_id: current_categories_salle_id[0]);
      final salleDoc = Salle(id_salle: '', name_salle: 'géneral', creation_date: '', is_private: false, category_salle_id: current_categories_salle_id[1]);
      final salleDis = Salle(id_salle: '', name_salle: 'géneral', creation_date: '', is_private: false, category_salle_id: current_categories_salle_id[2]);


      // création d'une salle pour chacun des trois catégories dans Firebase
      create.creationSalle(salleInfo);
      create.creationSalle(salleDoc);
      create.creationSalle(salleDis);

      // redirection vers la prochaine page en foction de la portée (privée ou public) de la classe
      (_privateClassroom == false)?Navigator.pushNamed(context, MainScreen.routeName):Navigator.pushNamed(context, AddFriendsPage.routeName);
    }catch(e){
      print(e);
    }
  }

  /*
  // methode de creation des trois categories de base
  List<CategorySalle> creationOfTheeBaseCategories(Classroom classroom)
  {
    List<CategorySalle> list_category = [];
    CategorySalle categorySalle = CategorySalle();
    List<String> name_category = ['SALLES INFORMATION', 'SALLES BIBLIOTHEQUE', 'SALLES DISCUSSION'];
    List<String> description_category = ['Salle de catégorie information', 'Salle de catégorie document', 'Salle de catégorie discussion'];
    List<EnumCategorySalle> type_category = [EnumCategorySalle.information, EnumCategorySalle.bibliotheque, EnumCategorySalle.discussion];

    for(int i=0; i<3; i++){
      categorySalle = CategorySalle(id_category:Increment.id_category, name_category:name_category[i], creation_date:'02/02/2022', description_category:description_category[i], is_private:false, type_category:type_category[i], classroom_id:classroom.idClassroom);
      data_List_categories_salle.add(categorySalle);
      list_category.add(categorySalle);
    }
    return list_category;
  }

  // methode de creation de la salle de base pour chacun des trois categories de base
  void creationOfBaseSalle(List<CategorySalle> list_category)
  {
    Salle salle = Salle();
    for(int i=0; i<3; i++){
      salle = Salle(id_salle:Increment.id_salle, name_salle:'géneral', creation_date:'12/02/2019', is_private:false, category_salle_id:list_category[i].idCategory);
      data_list_salles.add(salle);
    }
  }*/

}