import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

class InteractionComponent extends StatelessWidget
{
  InteractionComponent({Key? key, required this.title, required this.routeName}):super(key: key);
  final String title;
  final String routeName;
  @override
  build(BuildContext context)
  {
    return Container(
      color: kColorSearch,
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
        trailing: IconButton(
          icon: Icon(Icons.navigate_next),
          onPressed: (){
            Navigator.pushNamed(context, routeName);
          },
        ),
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
    );
  }
}