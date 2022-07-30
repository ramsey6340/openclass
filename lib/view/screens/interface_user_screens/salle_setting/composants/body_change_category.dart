import 'package:flutter/material.dart';

import 'change_category.dart';
class BodyChangeCategory extends StatefulWidget {
  const BodyChangeCategory({Key? key}) : super(key: key);

  @override
  State<BodyChangeCategory> createState() => _BodyChangeCategoryState();
  static String routeName = '/body_change_category';
}

class _BodyChangeCategoryState extends State<BodyChangeCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeCategory(),
    );
  }
}
