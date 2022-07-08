import 'package:flutter/material.dart';

class PhotoProfile extends StatelessWidget
{
  PhotoProfile({Key? key, required this.imgProfile, required this.nameUser, required this.dateBirth}):super(key: key);
  final String imgProfile;
  final String nameUser;
  final String dateBirth;
  @override
  build(BuildContext context)
  {
    return Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(imgProfile),
                ),
                onTap: (){},
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.edit, color: Colors.white,size: 35,),
              ),
            ],
          ),
          Text(nameUser, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),textAlign: TextAlign.center,),
          Text(dateBirth,textAlign: TextAlign.center,),
        ]
    );
  }
}