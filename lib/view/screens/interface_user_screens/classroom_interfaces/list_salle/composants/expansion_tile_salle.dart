import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/enum_type.dart';
import 'package:openclass/view/composants/loading.dart';
import '../../../../../../data/data_current.dart';
import '../../../../../../model/salle.dart';
import '../../../salle_setting/salle_setting_page.dart';

class ExpansionTileSalle extends StatefulWidget {
  ExpansionTileSalle({Key? key, required this.addNavigator, required this.category}):super(key: key);
  final Function addNavigator;
  final CategorySalle category;
  @override
  State<ExpansionTileSalle> createState() => _ExpansionTileSalleState();
}
class _ExpansionTileSalleState extends State<ExpansionTileSalle>{
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
          trailing: TextButton(
            child: Text("Modifier"),
            onPressed: widget.addNavigator as void Function(),
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
                current_category = widget.category;
                current_salle = item;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalleSettingPage(),
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

