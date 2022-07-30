import 'package:flutter/material.dart';
import '../../../../data/data_current.dart';
import '../../../../model/category_salle.dart';
import '../../../constante.dart';
import 'composants/body.dart';

class CategorySettingPage extends StatelessWidget
{
  static String routeName = '/category_setting_page';
  @override
  Widget build(BuildContext context)
  {
    current_category = ModalRoute.of(context)!.settings.arguments as CategorySalle;

    return Scaffold(
      backgroundColor: kColorComposant,
      body: Body(),
    );
  }
}