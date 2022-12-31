import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

/// Widget pour permettre de créer des éléments qui nous permet de passer d'une page à un autre
/// Ces élément possèdent une icone de flêche dirrigé vers la droite pour indiquer qu'on peut aller à une autre page

class InteractionComponent extends StatelessWidget
{
  InteractionComponent({Key? key, required this.title, required this.press}):super(key: key);
  final String title;
  Function press;
  @override
  build(BuildContext context)
  {
    return Container(
      color: kColorSearch,
      child: GestureDetector(
        child: ListTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
          trailing: IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: press as void Function()?,
          ),
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        onTap: press as void Function()?
      )
    );
  }
}