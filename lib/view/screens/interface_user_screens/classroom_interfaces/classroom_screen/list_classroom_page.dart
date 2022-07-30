import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constante.dart';
import 'composants/body.dart';

class ListClassroomPage extends StatelessWidget
{

  final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      color: kColorComposant,
      child: Body(),
    );
  }
}
