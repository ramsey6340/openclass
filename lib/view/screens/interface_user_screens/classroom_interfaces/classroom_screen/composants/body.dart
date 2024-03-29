import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/composants/loading.dart';
import '../../../../../../data/data_current.dart';
import 'interaction_component.dart';
import 'package:openclass/model/classroom.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  late String? id;
  initState(){
    super.initState();
    id = current_user_id;
    current_list_id_classroom = [];
  }
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    if(id == ''){
      return const Loading();
    }

    final Stream<QuerySnapshot> _classroomStream = db.collection('classrooms').where("membres", arrayContains: id).snapshots();


    return StreamBuilder<QuerySnapshot>(
      stream: _classroomStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Quelque chose s'est mal passé");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        return ListView.separated(
          separatorBuilder: (context,index) => Divider(color: Colors.white,height: 3,indent: 80,),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,index){
            final item = Classroom.fromSnapshot(snapshot.data?.docs[index]);
            current_list_id_classroom.add(item.id_classroom);
            return Dismissible(
              key: ValueKey<Classroom>(item),
              secondaryBackground: backgroundDelete,
              background: backgroundReaded,
              confirmDismiss: (direction) async{
                if(direction == DismissDirection.endToStart){
                  bool isDelete = await deleteDialog();
                  return isDelete;
                }
                else{}
              },
              onDismissed: (direction){
                if(direction == DismissDirection.endToStart){
                  setState((){
                    //data_list_classrooms.removeAt(index);
                  });
                }
                else if(direction == DismissDirection.startToEnd){
                  //ici on reinitialisera le nombre de message non lu à zéro
                }
              },
              child: InteractionComponent(classroom: item, nbreSMS: 0, subTitle: ''),
            );
          },
        );
      },
    );
  }


  final backgroundDelete = Container(
    child: Icon(Icons.delete,color: Colors.white,size: 40,),
    color: Colors.red,
  );

  final backgroundReaded = Container(
    child: Column(
      children: [
        Icon(Icons.chat_bubble,color: Colors.white,size: 40),
        Text('Lu'),
      ],
    ),
    color: Colors.blue,
  );

  // La methode pour afficher le message avent la suppression par le widget Dismissible
  static AlertDialog alertDialogDelete(BuildContext context)
  {
    return AlertDialog(
      title: Text('Supprimer la classe'),
      content: Text('En supprimer cette classe vous ne serrez plus membre de la classe'),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            },
            child: Text('supprimer',style: TextStyle(color: Colors.red),)
        ),
        TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text('annuler',style: TextStyle(color: Colors.blue),)
        ),
      ],
    );
  }

  Future<bool> deleteDialog() async
  {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => alertDialogDelete(context),
    );
  }
}