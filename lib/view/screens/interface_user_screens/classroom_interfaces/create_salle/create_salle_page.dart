import 'package:flutter/material.dart';
import 'package:openclass/model/category_salle.dart';
import 'composants/body.dart';

class CreateSallePage extends StatelessWidget
{
  static String routeName = '/create_salle_page';
  static bool privateSalle = false;
  @override
  build(BuildContext context)
  {
    final categorySalle = ModalRoute.of(context)!.settings.arguments as CategorySalle;
    return Scaffold(
      body: Body(categorySalle: categorySalle),
    );
  }


}
