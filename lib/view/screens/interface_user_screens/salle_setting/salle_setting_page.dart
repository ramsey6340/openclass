import 'package:flutter/material.dart';
import '../../../constante.dart';
import 'composants/body.dart';

class SalleSettingPage extends StatelessWidget
{
  static String routeName = '/salle_setting_page';
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorComposant,
      body: Body(),
    );
  }
}