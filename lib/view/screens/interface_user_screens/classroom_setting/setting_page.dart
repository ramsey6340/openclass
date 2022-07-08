import 'package:flutter/material.dart';
import '../../../constante.dart';
import 'composants/body.dart';

class SettingPage extends StatelessWidget
{
  static String routeName = '/setting_page';
  @override
  build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorComposant,
      body: Body(),
    );
  }
}