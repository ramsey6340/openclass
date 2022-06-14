import 'package:flutter/material.dart';
import '../../../chat_interface/chat_page.dart';
import 'package:openclass/model/user.dart';
import 'package:openclass/model/message.dart';

class InteractionComponent extends StatefulWidget
{
  InteractionComponent({Key? key,required this.receiver,required this.message,required this.nbreSMSMain}):super(key: key);
  final int nbreSMSMain;
  final User receiver;
  final Message message;

  int get nbreSMS => nbreSMSMain;
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
      selectedTileColor: Colors.grey,
      dense: true,
      textColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(widget.receiver.img_profile),
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
      title: Text(widget.receiver.first_name,style: styleTitle),
      subtitle: Text(widget.message.text,overflow: TextOverflow.ellipsis,),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ChatPageUser(user: widget.receiver,)));
      },
    );
  }
}