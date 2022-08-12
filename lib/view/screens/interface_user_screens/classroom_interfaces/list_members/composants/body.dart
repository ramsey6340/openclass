import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_friends/composants/contact.dart';
import '../../../../../../data/data_current.dart';
import '../../../../../../model/adhesion.dart';
import '../../../../../../model/user.dart';
import '../../../../../composants/loading.dart';
import '../../../../../composants/search_bar.dart';

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
    final Stream<QuerySnapshot> _membreStream = db.collection('users').where("id", whereIn: current_classroom.membres).snapshots();
    return Container(
      //color: kColorAppBar,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: ToolsBar.falseAppBar(
                Text('Retour'),
                'Membres',
                Text(''),
                (){
                  Navigator.of(context).pop();
                },
                (){}
            ),
          ),
          SearchBar(listSearch: current_list_name_members),
          Expanded(
            child: StreamBuilder(
              stream: _membreStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasError) {
                  return const Text("Quelque chose s'est mal passé");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Loading();
                }
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index){
                      final item = UserModel.fromSnapshot(snapshot.data?.docs[index]);
                      current_list_name_members.add('${item.first_name} ${item.last_name}');
                      return Contact(
                        imgContact: item.imgProfile!,
                        nameContact: item.firstName!+' '+item.lastName!,
                        action: IconButton(
                          icon: Icon(Icons.navigate_next, color: Colors.white,),
                          onPressed: (){},
                        ),
                      );
                    }
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // methode pour selectionner les membres de la classe courente
  List<UserModel> chooseMembers(List<Adhesion> list_adhesion)
  {
    List<UserModel> list_members = [];
    for(int i=0; i<list_adhesion.length; i++){
      if(current_classroom.idClassroom == list_adhesion[i].classroom_id){
        //list_members.add(list_adhesion[i].user);
      }
    }
    return list_members;
  }
}