import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/enum_type.dart';
import 'package:openclass/view/composants/loading.dart';
import '../../data/data_current.dart';
import '../../model/salle.dart';
import '../screens/interface_user_screens/chat_interface/chat_salle/chat_page_salle.dart';

class ExpansionTileTool extends StatefulWidget {
  ExpansionTileTool({Key? key, required this.addNavigator, required this.category}):super(key: key);
  final Function addNavigator;
  final CategorySalle category;
  @override
  State<ExpansionTileTool> createState() => _ExpansionTileToolState();
}
class _ExpansionTileToolState extends State<ExpansionTileTool>{
  final iconInfo = Icon(Icons.info_outlined,);
  final iconBiblio = Icon(Icons.import_contacts);
  final iconDiscussion = Icon(Icons.screenshot_monitor);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _salleStream = db.collection('salles').doc(widget.category.id_category).collection(widget.category.id_category).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _salleStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Quelque chose s'est mal passé");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          return ExpansionTile(
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
            iconColor: Colors.white,
            textColor: Colors.white,
            controlAffinity: ListTileControlAffinity.leading,
            childrenPadding: EdgeInsets.only(left: 50),
            trailing: GestureDetector(
              child: Icon(Icons.add),
              onTap: widget.addNavigator as void Function(),
            ),
            title: Text(widget.category.name_category!.toUpperCase(),style: TextStyle(fontSize: 16),),
            children:
              snapshot.data!.docs
              .map((DocumentSnapshot document) {
                final item = Salle.fromSnapshot(document);
                return ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                horizontalTitleGap: 0,
                title: Text(item.name_salle!,style: TextStyle(fontSize: 16,),),
                leading: (widget.category.type_category == EnumCategorySalle.information)?iconInfo:(widget.category.type_category == EnumCategorySalle.bibliotheque)?iconBiblio:iconDiscussion,
                onTap: (){
                  current_salle = item;
                  current_peer_id = current_salle.id_salle;
                  current_group_id = '';
                  if(current_user.id.hashCode <= current_peer_id.hashCode){
                    current_group_id = current_user.id+'-'+current_peer_id;
                  }
                  else{
                    current_group_id = current_peer_id+'-'+current_user.id;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPageSalle(),
                      )
                  );
                },
              );
          })
              .toList()
              .cast(),
          );
        },
    );
  }
}

