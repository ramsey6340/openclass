import 'package:flutter/material.dart';

import '../../../../../../model/user.dart';
import '../../../../../composants/search_bar.dart';
import '../../../../../composants/tools_bar.dart';
import '../../../../../constante.dart';
import '../../../classroom_interfaces/add_friends/composants/contact.dart';

class ListContactPage extends StatelessWidget {
  static String routeName = 'list_contact_page';


   List<UserModel> contact = [
/*
    UserModel(2,'Issa', 'Kamite', 'issa@gmail.com', '77391909', 'assets/images/img_default_person.png', '1234', '12/02/2022'),
    UserModel(3,'Ibrahime dit Bakoroba', 'Goumané', 'moussa@gmail.com', '66390178', 'assets/images/medecine.jpg', '4324', '12/03/2022'),
    UserModel(4,'Abdoulaye', 'Sacko', 'sacko@gmail.com', '77391909', 'assets/images/geologie.jpg', 'FR241', '12/02/2022'),
    UserModel(5,'Nouhoun', 'Soumare', 'togola@gmail.com', '77391909', 'assets/images/img_default_person.png', 'JK98', '12/04/2022'),
    UserModel(6,'Ousmane', 'Sanogo', 'ousmane@gmail.com', '77391909', 'assets/images/informatique.jpg', '5413', '12/05/2022'),
    UserModel(7,'Adama', 'Cisse', 'adama@gmail.com', '77391909', 'assets/images/medecine.jpg', '7642', '12/02/2022'),
    UserModel(8,'Issa', 'Coulibaly', 'baissa@gmail.com', '77391909', 'assets/images/img_default_person.png', '43256143', '12/06/2022'),
    UserModel(9,'Hassane', 'Sidibe', 'hassane@gmail.com', '77391909', 'assets/images/img_default_person.png', '643245', '12/07/2022'),
    UserModel(10,'Souleymane', 'Sougoule', 'sougoule@gmail.com', '77391909', 'assets/images/informatique.jpg', '4625', '12/08/2022'),
    UserModel(11,'Alhousseyni', 'Maiga', 'maiga@gmail.com', '77391909', 'assets/images/img_default_person.png', '9087', '12/09/2022'),
    UserModel(12,'Ibrahime', 'Traore', 'bolo@gmail.com', '77391909', 'assets/images/hackaTeam.png', 'huug-è(', '12/10/2022'),
    UserModel(13,'Aliou', 'Sow', 'sow@gmail.com', '77391909', 'assets/images/geekacademie.png', '0000', '12/11/2022'),
    UserModel(14,'Boubacar', 'Diarra', 'boubacar@gmail.com', '77391909', 'assets/images/img_default_person.png', '1234', '12/12/2022'),
  */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Icon(Icons.navigate_before),
          'Mes contactes',
          Text(""),
          (){
            Navigator.pop(context);
          },
          (){}
      ),
      body: Container(
        color: kColorAppBar,
        child: Column(
          children: [
            SearchBar(listSearch: []),
            Expanded(
              child: ListView.builder(
                  itemCount: contact.length,
                  itemBuilder: (context, index){
                    final item = contact[index];
                    return Contact(
                        imgContact: item.imgProfile!,
                        nameContact: item.firstName!+' '+item.lastName!,
                        action: ElevatedButton(
                          child: Text('Ajouter'),
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        )
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
