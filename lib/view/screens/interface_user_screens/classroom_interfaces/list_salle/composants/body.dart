import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import '../../../../../../data/data_current.dart';
import '../../../../../../model/category_salle.dart';
import '../../../../../../model/salle.dart';
import '../../../../../composants/loading.dart';
import '../../../../../constante.dart';
import '../../../category_setting/category_setting_page.dart';
import '../../../classroom_setting/setting_page.dart';
import 'expansion_tile_salle.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  @override
  Widget build(BuildContext context)
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    //final Stream<QuerySnapshot> _categorySalleStream = db.collection('categoriesSalles').doc(current_classroom.id_classroom).collection(current_classroom.id_classroom).orderBy('name_category').snapshots();
    final Stream<QuerySnapshot> _categorySalleStream = db.collection('categoriesSalles').where("classroom_id", isEqualTo: current_classroom.id_classroom).snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _categorySalleStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Quelque chose s'est mal passé");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          return SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ToolsBar.falseAppBar(
                      Text("Retour"),
                      'Salles',
                      Text(''),
                      (){
                        Navigator.pushNamed(context, SettingPage.routeName);
                      },
                      (){}
                  ),
                ),
                Expanded(
                  child: Container(
                    color: kColorAppBar,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final item = CategorySalle.fromSnapshot(snapshot.data?.docs[index]);
                        return ExpansionTileSalle(
                          addNavigator: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => CategorySettingPage(),
                                settings: RouteSettings(arguments: item)));
                          },
                          category: item,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }


  //methode pour choisir les salles correspondant à chaque categorie
  static List<Salle> chooseSalle(String? id_category, List<Salle> list_salles)
  {
    List<Salle> salles =[];
    for(int i=0; i<list_salles.length; i++){
      if(list_salles[i].categorySalleId == id_category){
        salles.add(list_salles[i]);
      }
    }
    return salles;
  }

}