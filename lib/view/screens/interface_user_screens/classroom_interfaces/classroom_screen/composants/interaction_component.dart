import 'package:flutter/material.dart';
import 'package:openclass/controller/classroom_ctrl.dart';
import 'package:openclass/model/classroom.dart';

import '../../../../../../data/data_current.dart';

class InteractionComponent extends  StatefulWidget
{
  InteractionComponent({required this.classroom, required this.nbreSMS, required this.subTitle});
  final int nbreSMS;
  final String subTitle;
  final Classroom classroom;
  @override
  State<InteractionComponent> createState() => _InteractionComponentState();
}

class _InteractionComponentState extends  State<InteractionComponent>
{
  ClassroomCtrl classroomCtrl = ClassroomCtrl();
  @override
  Widget build(BuildContext context) {
    TextStyle styleTitle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white);
    TextStyle styleNbreSMS = TextStyle(fontSize: 10,fontWeight: FontWeight.bold, color: Colors.white);

    return ListTile(
      dense: true,
      textColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
            (widget.classroom.imgProfile == '')? 'assets/images/img_default_class.png': widget.classroom.imgProfile
        ),
        radius: 25,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: (widget.nbreSMS==0)?Colors.transparent:Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: (widget.nbreSMS<=0)?Text(''):((widget.nbreSMS<1000)?Text('${widget.nbreSMS}',style: styleNbreSMS,textAlign: TextAlign.center,):Text('+999',style: styleNbreSMS,textAlign: TextAlign.center,)),
        ),
      ),
      title: Text(widget.classroom.nameClassroom,style: styleTitle, overflow: TextOverflow.ellipsis,),
      subtitle: Text(widget.subTitle,overflow: TextOverflow.ellipsis,),
      onTap: (){
         current_classroom = widget.classroom;
         classroomCtrl.modifClassroom(current_classroom);
        Scaffold.of(context).openEndDrawer();
      },
    );
  }

}