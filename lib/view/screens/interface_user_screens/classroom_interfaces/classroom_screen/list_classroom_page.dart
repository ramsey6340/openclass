import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import '../../../../composants/drawer_component.dart';
import 'composants/body.dart';

class ListClassroomPage extends StatelessWidget
{
  static String routeName = '/list_classroom_page';
  final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: Body(),
    );
  }
}
