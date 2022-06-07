import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import 'composants/body.dart';

class CreateClassroomPage extends StatelessWidget
{
  static String routeName = '/create_classroom_page';
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