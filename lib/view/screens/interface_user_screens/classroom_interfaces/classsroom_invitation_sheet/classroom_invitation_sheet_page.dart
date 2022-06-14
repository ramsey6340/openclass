import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

import '../../../../composants/search_bar.dart';
import '../add_friends/composants/contact.dart';
import 'composants/button_share_copy.dart';
import 'composants/header_invitation_sheet.dart';

class ClassroomInvitationSheetPage extends StatelessWidget
{

  List<Widget> contact = [

    Contact(imgContact: 'assets/images/img_default_person.png', nameContact: 'Kognouman', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/geologie.jpg', nameContact: 'Kassim', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/img_default_person.png', nameContact: 'BKT', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/hackaTeam.png', nameContact: 'Ousmane', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/medecine.jpg', nameContact: 'Togola', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/informatique.jpg', nameContact: 'Sacko', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/img_default_person.png', nameContact: 'Issa', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/img_default_person.png', nameContact: 'Kognouman', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/geologie.jpg', nameContact: 'Kassim', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/img_default_person.png', nameContact: 'BKT', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/hackaTeam.png', nameContact: 'Ousmane', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/medecine.jpg', nameContact: 'Togola', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/informatique.jpg', nameContact: 'Sacko', action: 'Ajouter'),
    Contact(imgContact: 'assets/images/img_default_person.png', nameContact: 'Issa', action: 'Ajouter'),

  ];

  @override
  build(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: Column(
          children: [
            HeaderInvitationSheet(),
            ButtonShareCopy(),
            SearchBar(listSearch: []),
            Expanded(
                child:  ListView.builder(
                    itemCount: contact.length,
                    itemBuilder: (context, index){
                      final item = contact[index];
                      return item;
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }
}