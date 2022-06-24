import 'package:flutter/material.dart';
import 'package:openclass/view/composants/list_tile_salle.dart';
import 'package:provider/provider.dart';
import '../../model/salle.dart';

class ListSalle extends StatelessWidget
{
  ListSalle({Key? key,required this.salles}):super(key: key);
  final List<Salle> salles;
  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: salles.length,
      itemBuilder: (context, index){
        final item = salles[index];
          return ListTileSalle(salleInit: item);
        },
    );
  }
}