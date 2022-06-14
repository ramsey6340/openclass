import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/classsroom_invitation_sheet/classroom_invitation_sheet_page.dart';

import '../constante.dart';

class InviteButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kColorSearch,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person_add),
            Text("  Inviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          ],
        ),
        onPressed: (){
          _showClassroomSettingSheet(context);
        },
      ),
    );
  }

  void _showClassroomSettingSheet(BuildContext context)
  {
    Navigator.pop(context);
    showModalBottomSheet(
        backgroundColor: kColorBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context){
          return ClassroomInvitationSheetPage();
        }
    );
  }
}