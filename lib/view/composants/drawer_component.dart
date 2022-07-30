import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/composants/drawer_header_tools.dart';
import 'package:openclass/view/composants/expansion_tile_tools.dart';
import 'package:openclass/view/composants/loading.dart';
import 'package:openclass/view/constante.dart';
import '../../model/category_salle.dart';
import '../../data/data_current.dart';
import '../screens/interface_user_screens/classroom_interfaces/create_salle/create_salle_page.dart';

class DrawerComponent extends StatefulWidget
{
  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}
class _DrawerComponentState extends State<DrawerComponent>
{
 @override
  Widget build(BuildContext context)
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _categorySalleStream = db.collection('categoriesSalles').doc(current_classroom.id_classroom).collection(current_classroom.id_classroom).orderBy('name_category').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _categorySalleStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Quelque chose s'est mal passé");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return Drawer(
          backgroundColor: kColorDrawer,
          width: MediaQuery.of(context).size.width * 0.82,
          child: Column(
            children: <Widget>[
              DrawerHeaderTools(nameClasse: current_classroom.nameClassroom!, classroom: current_classroom,),
              Divider(color: Colors.white, height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final item = CategorySalle.fromSnapshot(snapshot.data?.docs[index]);
                    return ExpansionTileTool(
                      addNavigator: () {
                        Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => CreateSallePage(),
                        settings: RouteSettings(arguments: item)));
                      },
                      category: item,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}