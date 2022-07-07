import 'package:flutter/material.dart';
import 'package:openclass/increment.dart';
import 'package:openclass/model/classroom.dart';

class InteractionComponent extends StatelessWidget
{
  InteractionComponent({required this.classroom, required this.nbreSMS, required this.subTitle});
  final int nbreSMS;
  final String subTitle;
  final Classroom classroom;
  @override
  Widget build(BuildContext context) {

    TextStyle styleTitle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white);
    TextStyle styleNbreSMS = TextStyle(fontSize: 10,fontWeight: FontWeight.bold, color: Colors.white);

    return ListTile(
      dense: true,
      textColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(classroom.image),
        radius: 25,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: (nbreSMS==0)?Colors.transparent:Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: (nbreSMS<=0)?Text(''):((nbreSMS<1000)?Text('${nbreSMS}',style: styleNbreSMS,textAlign: TextAlign.center,):Text('+999',style: styleNbreSMS,textAlign: TextAlign.center,)),
        ),
      ),
      title: Text(classroom.name,style: styleTitle, overflow: TextOverflow.ellipsis,),
      subtitle: Text(subTitle,overflow: TextOverflow.ellipsis,),
      onTap: (){
        /*
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DrawerComponent(),
              settings: RouteSettings(
                arguments: classroom,
              )
            )
        );
         */
        //Navigator.pop(context);
        Increment.idCurrentClassroom = classroom.id;
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}