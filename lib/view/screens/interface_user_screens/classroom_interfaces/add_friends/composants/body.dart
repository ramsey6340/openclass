import 'package:flutter/material.dart';
import 'package:openclass/view/composants/search_bar.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_friends/composants/contact.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
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
    return Container(
      color: kColorAppBar,
      child: Column(
        children: [
          SearchBar(listSearch: []),
          Expanded(
              child: ListView.builder(
                  itemCount: contact.length,
                  itemBuilder: (context, index){
                    final item = contact[index];
                    return item;
                  }
              ),
          ),
        ],
      ),
    );
  }
}