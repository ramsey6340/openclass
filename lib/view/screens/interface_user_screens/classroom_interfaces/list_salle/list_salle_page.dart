import 'package:flutter/material.dart';
import '../../../../constante.dart';
import 'composants/body.dart';

class ListSallePage extends StatelessWidget
{
  static String routeName = 'List_salle_page';

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorComposant,
      body: Body(),
    );
  }
}