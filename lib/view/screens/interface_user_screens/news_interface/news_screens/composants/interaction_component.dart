import 'package:flutter/material.dart';

import '../../../../../constante.dart';


class InteractionComponent extends StatelessWidget
{
  InteractionComponent({required this.imageAvatar, required this.title, required this.subTitle, required this.content});
  final String imageAvatar;
  final String title;
  final String subTitle;
  final String content;
  @override
  Widget build(BuildContext context) {

    TextStyle styleTitle = TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold);
    TextStyle styleSubTitle = TextStyle(color: kColorPrimary, fontSize: 20);
    TextStyle styleContent = TextStyle(color: Colors.white, fontSize: 16);

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 25,
          backgroundImage: AssetImage(imageAvatar),
        ),
        title: Text(title,style: styleTitle,),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subTitle, style: styleSubTitle, maxLines: 1,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 10,),
            Text(content, style: styleContent, maxLines: 10,),
          ],
        ),
      ),
    );
  }
}