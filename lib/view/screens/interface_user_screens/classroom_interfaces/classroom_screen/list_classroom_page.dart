import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import '../../../../composants/bottom_navigation_bar_tools.dart';
import '../../../../composants/drawer_component.dart';
import 'composants/body.dart';

class ListClassroomPage extends StatelessWidget
{
  static String routeName = '/list_classroom_page';
  final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawerEnableOpenDragGesture: false,
      appBar: ToolsBar.appBar('Modifier','Mes classe', Icon(Icons.add_circle_outline_rounded),(){},(){} ),
      endDrawer: DrawerComponent(),
      body: Body(),
      bottomNavigationBar: BottomNavigationBarTools(),
    );
  }
}
