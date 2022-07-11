import 'package:flutter/material.dart';
import '../../../../constante.dart';
import 'composants/body.dart';

class ListMembersPage extends StatelessWidget
{
  static String routeName = 'List_members_page';

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorComposant,
      body: Body(),
    );
  }
}