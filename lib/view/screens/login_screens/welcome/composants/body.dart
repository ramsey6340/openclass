import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constante.dart';
import 'choose_action.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundConfig,
      child: ChooseAction(),
    );
  }
}