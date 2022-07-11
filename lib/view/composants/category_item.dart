import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget
{
  CategoryItem({Key? key, required this.title, required this.description, required this.leading, required this.radio}):super(key: key);
  final String title;
  final String description;
  final Widget? leading;
  final Radio radio;
  @override
  build(BuildContext context)
  {
    return ListTile(
      leading: leading,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          Text(description, style: TextStyle(color: Colors.white), maxLines: 2,),
        ],
      ),
      trailing: radio,
    );
  }
}