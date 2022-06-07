import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constante.dart';
import 'composants/body.dart';

class ChatPage extends StatelessWidget
{
  static String routeName = '/chat_page';
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kColorComposant,
      child: Body(),
    );
  }
}
