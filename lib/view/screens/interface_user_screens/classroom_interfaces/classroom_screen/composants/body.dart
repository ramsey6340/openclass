import 'package:flutter/material.dart';
import 'interaction_component.dart';
import 'package:openclass/data/data_classroom.dart';
import 'package:openclass/model/classroom.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        separatorBuilder: (context,index) => Divider(color: Colors.white,height: 3,indent: 80,),
        itemCount: data_list_classrooms.length,
        itemBuilder: (context,index){
          index = (data_list_classrooms.length-1)-index;
          final item = data_list_classrooms[index];
          return Dismissible(
            key: ValueKey<Classroom>(data_list_classrooms[index]),
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
                  data_list_classrooms.removeAt(index);
                });
              }
              else if(direction == DismissDirection.startToEnd){
                //ici on reinitialisera le nombre de message non lu à zéro
              }
            },
            child: InteractionComponent(classroom: item, nbreSMS: 12, subTitle: 'd'),
          );
        },
      ),
    );
  }

  //methode pour choisir les classes créer par l'utilisateur courent
  static List<Classroom> chooseMyClassroom(int id_current_user, List<Classroom> list_classrooms)
  {
    List<Classroom> classrooms = [];
    for(int i=0; i<list_classrooms.length; i++){
      if(list_classrooms[i].responsible.id == id_current_user){
        classrooms.add(list_classrooms[i]);
      }
    }
    return classrooms;
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