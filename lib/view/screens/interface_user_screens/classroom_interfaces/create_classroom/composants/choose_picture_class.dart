import 'dart:io';
import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

class ChoosePictureClass extends StatelessWidget
{
  ChoosePictureClass({Key? key, required this.imgClass}):super(key: key);
  final File? imgClass;
  Icon iconCamera = Icon(Icons.camera_alt, color: Colors.white,size: 35,);
  Icon iconAdd = Icon(Icons.add_circle, color: Color(0xFF7b3f7b),size: 35);
  Image img = Image.asset('assets/images/informatique.jpg');
  @override
  build(BuildContext context)
  {
    return Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                child: Container(
                  //color: Colors.transparent,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white  ),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: kColorDrawer,
                    child: (imgClass == null)?iconCamera:img,
                  ),
                ),
                onTap: (){},
              ),
              Positioned(
                top: 0,
                right: 0,
                child: iconAdd,
              ),
            ],
          ),
        ]
    );
  }
}