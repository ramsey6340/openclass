import 'package:flutter/material.dart';
import '../../../../../constante.dart';

class InteractionComponent extends StatefulWidget
{
  InteractionComponent({Key? key,required this.imageAvatarMain,required this.nbreSMSMain, required this.titleMain, required this.subTitleMain}):super(key: key);
  final String imageAvatarMain;
  final int nbreSMSMain;
  final String titleMain;
  final String subTitleMain;

  @override
  State<InteractionComponent> createState() => _InteractionComponentState(imageAvatar: imageAvatarMain,nbreSMS: nbreSMSMain,title: titleMain,subTitle: subTitleMain);
}

class _InteractionComponentState extends State<InteractionComponent>
{
  _InteractionComponentState({required this.imageAvatar,required this.nbreSMS, required this.title, required this.subTitle});
  final String imageAvatar;
  final int nbreSMS;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {

    TextStyle styleTitle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
    TextStyle styleNbreSMS = TextStyle(fontSize: 10,fontWeight: FontWeight.bold);

    return ListTile(
      selectedTileColor: kColorAppBar,
      dense: true,
      textColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(imageAvatar),
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
      title: Text(title,style: styleTitle),
      subtitle: Text(subTitle,overflow: TextOverflow.ellipsis,),
      onTap: (){},
    );
  }
}