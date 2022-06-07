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
    InteractionComponent(imageAvatar: 'assets/images/informatique.jpg', title: 'Aliou Sow', subTitle: 'GIT-L3-S6', content: "L'informatique est un domaine d'activité scientifique, technique, et industriel concernant le traitement automatique de l'information numérique par l'exécution de programmes informatiques hébergés par des dispositifs électriques-électroniques : des systèmes embarqués, des ordinateurs, des robots, des automates, etc."),
    InteractionComponent(imageAvatar: 'assets/images/hackaTeam.png', title: 'Issa', subTitle: 'HackaTeam', content: "Le hacking est initialement la bidouille et l’expérimentation, dont les motivations sont notamment la passion, le jeu, le plaisir, l’échange, le besoin et le partage.Cette pratique, établie par les hackers, apparaît avec les premiers ordinateurs domestiques et hérite des domaines de l'électronique et de la radio amateur. Le hacking est ainsi, plus généralement, un ensemble de techniques permettant d'exploiter les possibilités, failles et vulnérabilités d'un élément ou d'un groupe d'éléments matériels ou humains. Il comprend également la réparation, la maintenance ou l’amélioration de matériel ou de logiciels anciens, dont la documentation n'est plus disponible, en pratiquant la rétro-ingénierie."),
    InteractionComponent(imageAvatar: 'assets/images/medecine.jpg', title: 'Togola', subTitle: 'FMOS', content: "Un médecin est un professionnel de la santé titulaire d'un diplôme de docteur en médecine ou, en France d'un diplôme d'État de docteur en médecine. Il soigne selon ses spécialisations les maladies, pathologies et blessures de l'être humain. Il travaille généralement au sein d'une équipe de professionnels de la santé comme la sage-femme, le psychologue, le diététicien, le pharmacien, le physicien médical, l'infirmier ou le chirurgien-dentiste. L'approche ethnologique1 référence différentes sortes de médecins (ethno-médecine) à travers le monde, au sens étymologique, avec des rituels validant parfois la formation."),
    InteractionComponent(imageAvatar: 'assets/images/img_default_class.png', title: 'Ousmane', subTitle: 'TLL', content: "Literature broadly is any collection of written work, but it is also used more narrowly for writings specifically considered to be an art form, especially prose fiction, drama, and poetry.[2] In recent centuries, the definition has expanded to include oral literature, much of which has been transcribed.[3] Literature is a method of recording, preserving, and transmitting knowledge and entertainment, and can also have a social, psychological, spiritual, or political role."),
    InteractionComponent(imageAvatar: 'assets/images/geekacademie.png', title: 'Drissa', subTitle: 'Geek Academie', content: "Un geek [ɡik]1 (de l'anglais : [ɡiːk]2 Écouter) est une personne passionnée par un ou plusieurs domaines précis, le plus souvent pour les domaines liés aux « cultures de l'imaginaire » (certains genres du cinéma, la bande dessinée, les jeux vidéo, les jeux de rôles, etc.), ou encore aux sciences, à la technologie et l'informatique3. Cette définition est celle qui ressort le plus souvent, bien qu'elle puisse varier d'un individu à l'autre. Au féminin, le terme « geekette » est souvent employé."),
    InteractionComponent(imageAvatar: 'assets/images/informatique.jpg', title: 'Aliou Sow', subTitle: 'GIT-L3-S6', content: "L'informatique est un domaine d'activité scientifique, technique, et industriel concernant le traitement automatique de l'information numérique par l'exécution de programmes informatiques hébergés par des dispositifs électriques-électroniques : des systèmes embarqués, des ordinateurs, des robots, des automates, etc."),
    InteractionComponent(imageAvatar: 'assets/images/hackaTeam.png', title: 'Issa', subTitle: 'HackaTeam', content: "Le hacking est initialement la bidouille et l’expérimentation, dont les motivations sont notamment la passion, le jeu, le plaisir, l’échange, le besoin et le partage.Cette pratique, établie par les hackers, apparaît avec les premiers ordinateurs domestiques et hérite des domaines de l'électronique et de la radio amateur. Le hacking est ainsi, plus généralement, un ensemble de techniques permettant d'exploiter les possibilités, failles et vulnérabilités d'un élément ou d'un groupe d'éléments matériels ou humains. Il comprend également la réparation, la maintenance ou l’amélioration de matériel ou de logiciels anciens, dont la documentation n'est plus disponible, en pratiquant la rétro-ingénierie."),
    InteractionComponent(imageAvatar: 'assets/images/medecine.jpg', title: 'Togola', subTitle: 'FMOS', content: "Un médecin est un professionnel de la santé titulaire d'un diplôme de docteur en médecine ou, en France d'un diplôme d'État de docteur en médecine. Il soigne selon ses spécialisations les maladies, pathologies et blessures de l'être humain. Il travaille généralement au sein d'une équipe de professionnels de la santé comme la sage-femme, le psychologue, le diététicien, le pharmacien, le physicien médical, l'infirmier ou le chirurgien-dentiste. L'approche ethnologique1 référence différentes sortes de médecins (ethno-médecine) à travers le monde, au sens étymologique, avec des rituels validant parfois la formation."),
    InteractionComponent(imageAvatar: 'assets/images/img_default_class.png', title: 'Ousmane', subTitle: 'TLL', content: "Literature broadly is any collection of written work, but it is also used more narrowly for writings specifically considered to be an art form, especially prose fiction, drama, and poetry.[2] In recent centuries, the definition has expanded to include oral literature, much of which has been transcribed.[3] Literature is a method of recording, preserving, and transmitting knowledge and entertainment, and can also have a social, psychological, spiritual, or political role."),
    InteractionComponent(imageAvatar: 'assets/images/geekacademie.png', title: 'Drissa', subTitle: 'Geek Academie', content: "Un geek [ɡik]1 (de l'anglais : [ɡiːk]2 Écouter) est une personne passionnée par un ou plusieurs domaines précis, le plus souvent pour les domaines liés aux « cultures de l'imaginaire » (certains genres du cinéma, la bande dessinée, les jeux vidéo, les jeux de rôles, etc.), ou encore aux sciences, à la technologie et l'informatique3. Cette définition est celle qui ressort le plus souvent, bien qu'elle puisse varier d'un individu à l'autre. Au féminin, le terme « geekette » est souvent employé."),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        separatorBuilder: (context,index) => Divider(color: Colors.white,height: 10,thickness: 0.3,),
        itemCount: interactionComponentMain.length,
        itemBuilder: (context,index){
          final item = interactionComponentMain[index];
          return item;
        },
      ),
    );
  }
}