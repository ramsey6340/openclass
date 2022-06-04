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
  List<Widget> interactionComponentMain = [
    InteractionComponent(imageAvatar: 'assets/images/informatique.jpg', title: 'Issa', subTitle: 'GIT-L3-S6', content: 'je suis le contenueje suis le contenueje suis le contenueje\n suis le contenueje suis le contenueje suis le contenueje suis le \ncontenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenueje suis le contenue'),
    //InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 0, titleMain: 'Moussa', subTitleMain: 'Tu vas à l\'école demain'),
    //InteractionComponent(imageAvatarMain: 'assets/images/medecine.jpg', nbreSMSMain: 354, titleMain: 'Abdoulaye', subTitleMain: 'Le document que tu ma envoyer est très interessant, merci'),
    //InteractionComponent(imageAvatarMain: 'assets/images/geologie.jpg', nbreSMSMain: 0, titleMain: 'Togola', subTitleMain: 'effectivement tu as raison, je vais essayer de voir ce que je peux faire avant Lundi'),
    //InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 0, titleMain: 'Ousmane', subTitleMain: 'Salut le petit scarabet'),
    //InteractionComponent(imageAvatarMain: 'assets/images/informatique.jpg', nbreSMSMain: 0, titleMain: 'Adama', subTitleMain: 'Tu es trop génial Drissa, et moi je suis un pétit'),
    //InteractionComponent(imageAvatarMain: 'assets/images/medecine.jpg', nbreSMSMain: 1232, titleMain: 'Baissa', subTitleMain: 'Waleykoum salam couz, comment tu vas ?'),
    //InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 5, titleMain: 'Hassan', subTitleMain: 'Incha Allah'),
    //InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 2214, titleMain: 'Sougoulé', subTitleMain: 'Amine mon frère'),
    //InteractionComponent(imageAvatarMain: 'assets/images/informatique.jpg', nbreSMSMain: 0, titleMain: 'Alhousseyni', subTitleMain: 'Vraiment tu ma laissé'),
    //InteractionComponent(imageAvatarMain: 'assets/images/img_default_class.png', nbreSMSMain: 1, titleMain: 'Ibrahim', subTitleMain: 'Petit'),
    //InteractionComponent(imageAvatarMain: 'assets/images/hackaTeam.png', nbreSMSMain: 0, titleMain: 'Sow', subTitleMain: 'Il as dit qu\'on vas avancer en cour'),
    //InteractionComponent(imageAvatarMain: 'assets/images/geekacademie.png', nbreSMSMain: 0, titleMain: 'Boubacar', subTitleMain: 'ok on fait comme ça'),
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
              background: backgroundDelete,
              onDismissed: (direction){
                  setState((){
                    interactionComponentMain.removeAt(index);
                  });
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
}