import 'package:flutter/material.dart';
import 'package:openclass/model/classroom.dart';

class InteractionComponent extends StatefulWidget
{
  InteractionComponent({required this.classroom, required this.nbreSMS, required this.subTitle});
  final int nbreSMS;
  final String subTitle;
  final Classroom classroom;
  @override
  State<InteractionComponent> createState() => _InteractionComponentState();
}
class _InteractionComponentState extends State<InteractionComponent>
{

  @override
  Widget build(BuildContext context) {

    TextStyle styleTitle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
    TextStyle styleNbreSMS = TextStyle(fontSize: 10,fontWeight: FontWeight.bold);

    return ListTile(
      dense: true,
      textColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(widget.classroom.image),
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
      title: Text(widget.classroom.name,style: styleTitle),
      subtitle: Text(widget.subTitle,overflow: TextOverflow.ellipsis,),
      onTap: (){
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}