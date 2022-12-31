import 'package:flutter/material.dart';
import 'package:openclass/view/composants/show_setting_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/classsroom_invitation_sheet/classroom_invitation_sheet_page.dart';
import '../constante.dart';

/// Widget pour crée le boutton qui permet d'inviter d'autre personne dans la classe

class InviteButton extends StatelessWidget
{
  const InviteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorSearch,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.person_add),
            Text("  Inviter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          ],
        ),
        onPressed: (){
          ShowSettingPage.showSettingPage(context, ClassroomInvitationSheetPage());
        },
      ),
    );
  }

}