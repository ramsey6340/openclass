import 'package:flutter/material.dart';
import '../../../constante.dart';
import 'composants/body.dart';

class CategorySettingPage extends StatelessWidget
{
  static String routeName = '/category_setting_page';
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorComposant,
      body: Body(),
    );
  }
}