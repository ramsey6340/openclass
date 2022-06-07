import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import 'composants/body.dart';

class JoinClassroomPage extends StatelessWidget
{
  static String routeName = '/join_classroom_page';
  @override
  build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorDrawer,
      appBar: AppBar(
        backgroundColor: kColorDrawer,
      ),
      body: Body(),
    );
  }
}