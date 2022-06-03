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
    //SearchBar(),
    InteractionComponent(imageAvatarMain: 'assets/images/informatique.jpg', nbreSMSMain: nbreSMS, titleMain: 'GIT-L3-S6', subTitleMain: 'Ici on parle uniquement de l\'informatique et de la télécommunication'),
    InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 0, titleMain: 'Hyper', subTitleMain: 'Le sol doit être protégé'),
    InteractionComponent(imageAvatarMain: 'assets/images/medecine.jpg', nbreSMSMain: 354, titleMain: 'FMOS', subTitleMain: 'La santé vaut plus que de l\'argent'),
    InteractionComponent(imageAvatarMain: 'assets/images/geologie.jpg', nbreSMSMain: 0, titleMain: 'Géologie', subTitleMain: 'Nous somme les plus riche'),
    InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 0, titleMain: 'TSExp', subTitleMain: 'Future Medecin'),
    InteractionComponent(imageAvatarMain: 'assets/images/informatique.jpg', nbreSMSMain: 0, titleMain: 'GME-L2-S3', subTitleMain: 'Faison du bricolage'),
    InteractionComponent(imageAvatarMain: 'assets/images/medecine.jpg', nbreSMSMain: 1232, titleMain: 'TSE', subTitleMain: 'Vive la Mathématique'),
    InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 5, titleMain: 'TLL', subTitleMain: 'Aristote a dit ...'),
    InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 2214, titleMain: '9eme Année', subTitleMain: ''),
    InteractionComponent(imageAvatarMain: 'assets/images/informatique.jpg', nbreSMSMain: 0, titleMain: 'GIT-M1-S1', subTitleMain: 'Le savoir c\'est tout'),
    InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 1, titleMain: 'Artostate', subTitleMain: 'Blablabla...'),
    InteractionComponent(imageAvatarMain: 'assets/images/hackaTeam.png', nbreSMSMain: 0, titleMain: 'HackaTeam', subTitleMain: 'Faisons du Hacking'),
    InteractionComponent(imageAvatarMain: 'assets/images/geekacademie.png', nbreSMSMain: 0, titleMain: 'GeeK Academie', subTitleMain: 'Oui je suis un Geek'),
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