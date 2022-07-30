import 'package:flutter/material.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/category_salle.dart';
import 'composants/body.dart';

class CreateSallePage extends StatelessWidget
{
  static String routeName = '/create_salle_page';
  @override
  build(BuildContext context)
  {
    current_category = ModalRoute.of(context)!.settings.arguments as CategorySalle;
    return Scaffold(
      body: Body(),
    );
  }


}
