import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/CRUD/read.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/composants/drawer_header_tools.dart';
import 'package:openclass/view/composants/expansion_tile_tools.dart';
import 'package:openclass/view/composants/loading.dart';
import 'package:openclass/view/constante.dart';
import '../../model/category_salle.dart';
import '../screens/interface_user_screens/classroom_interfaces/create_salle/create_salle_page.dart';


/// Widget qui contient tout le contenue du drawer dans l'interface des classes
/// Tous ce qui se touvre dans le drawer comme les salles, les catégorie seront afficher par ce widget


class DrawerComponent extends StatefulWidget
{
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}
class _DrawerComponentState extends State<DrawerComponent>
{
  Read read = Read();
  // inspire toi de ça
  late String chaine;
 @override
  Widget build(BuildContext context)
  {

    FirebaseFirestore db = FirebaseFirestore.instance;
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
        return Drawer(
          backgroundColor: kColorDrawer,
          width: MediaQuery.of(context).size.width * 0.82,
          child: Column(
            children: <Widget>[
              DrawerHeaderTools(nameClasse: current_classroom.nameClassroom, classroom: current_classroom,),
              const Divider(color: Colors.white, height: 20,),
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