import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/data/data_current.dart';
import '../../../../../../model/information.dart';
import '../../../../../composants/loading.dart';
import '../../../../../composants/search_bar.dart';
import 'interaction_component.dart';
import '../../../../../constante.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _streamInfo = db.collection("informations").where("id_classroom", whereIn: list_id_classroom).snapshots();
    return StreamBuilder(
        stream: _streamInfo,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Quelque chose s'est mal passé");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          return SafeArea(
            child: ListView.separated(
              separatorBuilder: (context,index) => Divider(color: Colors.white,height: 10,thickness: 0.3,),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                final item = Information.fromSnapshot(snapshot.data?.docs[index]);
                return InteractionComponent(
                    imageAvatar: 'assets/images/img_default_person.png',
                    title: item.name_classroom!,
                    subTitle: item.user_action_name,
                    content: item.content_action!
                );
              },
            ),
          );
        }
    );
  }
}