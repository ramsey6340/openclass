import 'package:flutter/material.dart';

class ButtonShareCopy extends StatelessWidget
{
  @override
  build(BuildContext context)
  {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 25,
                  child: IconButton(
                    icon: Icon(Icons.share, color: Colors.white,),
                    onPressed: (){},
                  ),
                ),
                Text("Partager"),
              ],
            ),
            SizedBox(width: 20,),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 25,
                  child: IconButton(
                    icon: Icon(Icons.copy, color: Colors.white,),
                    onPressed: (){},
                  ),
                ),
                Text("Copier le lien"),
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        Divider(color: Colors.white,height: 10,thickness: 0.5,),
      ],
    );
  }
}