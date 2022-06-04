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

    TextStyle styleTitle = TextStyle(fontSize: 20,fontWeight: FontWeight.bold);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(imageAvatar),
                  radius: 25,
                ),
            SizedBox(width: 10,),
            Container(
              width: MediaQuery.of(context).size.width*0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text(subTitle, style: TextStyle(fontSize: 20, color: kColorPrimary),),
                  Text(content, style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ],
        ),
    );
  }
}