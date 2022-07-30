import 'package:flutter/material.dart';
import 'package:openclass/model/user.dart';
import 'package:openclass/model/message.dart';

import '../../../../../../data/data_current.dart';
import '../../../chat_interface/chat_friend/chat_page_user.dart';

class InteractionComponent extends StatefulWidget
{
  InteractionComponent({Key? key,required this.receiver, required this.message,required this.nbreSMSMain}):super(key: key);
  final int nbreSMSMain;
  final UserModel receiver;
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
        backgroundImage: AssetImage('assets/images/img_default_person.png'),
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
      title: Text(widget.receiver.firstName!,style: styleTitle),
      //subtitle: Text(widget.message.content!,overflow: TextOverflow.ellipsis,),
      onTap: (){
        current_friend = widget.receiver;
        current_peer_id = current_friend.id;
        current_group_id = current_user.id+'-'+current_peer_id;
        Navigator.pushNamed(context, ChatPageUser.routeName);
      },
    );
  }
}