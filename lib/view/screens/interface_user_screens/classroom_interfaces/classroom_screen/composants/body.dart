import 'package:flutter/material.dart';
import '../../../../../composants/search_bar.dart';
import 'interaction_component.dart';
import '../../../../../constante.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  static int nbreSMS = 12;
  List<Widget> interactionComponentMain = [
    InteractionComponent(imageAvatar: 'assets/images/informatique.jpg', nbreSMS: nbreSMS, title: 'GIT-L3-S6', subTitle: 'Ici on parle uniquement de l\'informatique et de la télécommunication'),
    InteractionComponent(imageAvatar: 'assets/images/img_default_class.png', nbreSMS: 0, title: 'Hyper', subTitle: 'Le sol doit être protégé'),
    InteractionComponent(imageAvatar: 'assets/images/medecine.jpg', nbreSMS: 354, title: 'FMOS', subTitle: 'La santé vaut plus que de l\'argent'),
    InteractionComponent(imageAvatar: 'assets/images/geologie.jpg', nbreSMS: 0, title: 'Géologie', subTitle: 'Nous somme les plus riche'),
    InteractionComponent(imageAvatar: 'assets/images/img_default_class.png', nbreSMS: 0, title: 'TSExp', subTitle: 'Future Medecin'),
    InteractionComponent(imageAvatar: 'assets/images/informatique.jpg', nbreSMS: 0, title: 'GME-L2-S3', subTitle: 'Faison du bricolage'),
    InteractionComponent(imageAvatar: 'assets/images/medecine.jpg', nbreSMS: 1232, title: 'TSE', subTitle: 'Vive la Mathématique'),
    InteractionComponent(imageAvatar: 'assets/images/img_default_class.png', nbreSMS: 5, title: 'TLL', subTitle: 'Aristote a dit ...'),
    InteractionComponent(imageAvatar: 'assets/images/img_default_class.png', nbreSMS: 2214, title: '9eme Année', subTitle: ''),
    InteractionComponent(imageAvatar: 'assets/images/informatique.jpg', nbreSMS: 0, title: 'GIT-M1-S1', subTitle: 'Le savoir c\'est tout'),
    InteractionComponent(imageAvatar: 'assets/images/img_default_class.png', nbreSMS: 1, title: 'Artostate', subTitle: 'Blablabla...'),
    InteractionComponent(imageAvatar: 'assets/images/hackaTeam.png', nbreSMS: 0, title: 'HackaTeam', subTitle: 'Faisons du Hacking'),
    InteractionComponent(imageAvatar: 'assets/images/geekacademie.png', nbreSMS: 0, title: 'GeeK Academie', subTitle: 'Oui je suis un Geek'),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorComposant,
      child: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context,index) => Divider(color: Colors.white,height: 3,indent: 80,),
          itemCount: interactionComponentMain.length,
            itemBuilder: (context,index){
            final item = interactionComponentMain[index];
            return Dismissible(
                key: ValueKey<Widget>(interactionComponentMain[index]),
                secondaryBackground: backgroundDelete,
                background: backgroundReaded,
                confirmDismiss: (direction) async{
                  if(direction == DismissDirection.endToStart){
                    bool isDelete = await deleteDialog();
                    return isDelete;
                  }
                  else{}
                },
                onDismissed: (direction){
                  if(direction == DismissDirection.endToStart){
                    setState((){
                      interactionComponentMain.removeAt(index);
                    });
                  }
                  else if(direction == DismissDirection.startToEnd){
                    //ici on reinitialisera le nombre de message non lu à zéro
                    setState((){
                      nbreSMS = 0;
                    });
                  }
                },
                child: item,
            );
            },
        ),
      ),
    );
  }

  final backgroundDelete = Container(
    child: Icon(Icons.delete,color: Colors.white,size: 40,),
    color: Colors.red,
  );

  final backgroundReaded = Container(
    child: Column(
      children: [
        Icon(Icons.chat_bubble,color: Colors.white,size: 40),
        Text('Lu'),
      ],
    ),
    color: Colors.blue,
  );

  // La methode pour afficher le message avent la suppression par le widget Dismissible
  static AlertDialog alertDialogDelete(BuildContext context)
  {
    return AlertDialog(
      title: Text('Supprimer la classe'),
      content: Text('En supprimer cette classe vous ne serrez plus membre de la classe'),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            },
            child: Text('supprimer',style: TextStyle(color: Colors.red),)
        ),
        TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text('annuler',style: TextStyle(color: Colors.blue),)
        ),
      ],
    );
  }

  Future<bool> deleteDialog() async
  {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => alertDialogDelete(context),
    );
  }
}