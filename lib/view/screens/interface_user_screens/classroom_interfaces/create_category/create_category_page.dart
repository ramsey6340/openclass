import 'package:flutter/material.dart';
import '../../../../../model/classroom.dart';
import 'composants/body.dart';

class CreateCategoryPage extends StatelessWidget
{
  static String routeName = '/create_category_page';
  @override
  build(BuildContext context)
  {
    final classroom = ModalRoute.of(context)!.settings.arguments as Classroom;
    return Scaffold(
      body: Body(classroom: classroom),
    );
  }
}