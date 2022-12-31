import 'package:flutter/material.dart';

/// Widget pour permettre de choisir une catégorie (possedant un tire, une description) grâce à un boutton ratio
/// Il affiche un seul catégorie avec un boutton ration

class CategoryItem extends StatelessWidget
{
  const CategoryItem({Key? key, required this.title, required this.description, required this.leading, required this.radio}):super(key: key);
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
          Text(title,style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          Text(description, style: const TextStyle(color: Colors.white), maxLines: 2,),
        ],
      ),
      trailing: radio,
    );
  }
}