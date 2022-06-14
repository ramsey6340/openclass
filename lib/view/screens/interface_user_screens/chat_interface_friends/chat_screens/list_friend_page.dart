import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constante.dart';
import 'composants/body.dart';

class ListFriendPage extends StatelessWidget
{
  static String routeName = '/list_friend_page';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorComposant,
      child: Body(),
    );
  }
}
