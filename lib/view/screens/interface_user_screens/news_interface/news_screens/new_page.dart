import 'package:flutter/material.dart';
import '../../../../constante.dart';
import 'composants/body.dart';

class NewPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: kColorComposant,
      child: Body(),
    );
  }
}