import 'package:flutter/material.dart';
import 'package:openclass/view/composants/list_tile_salle.dart';
import 'package:openclass/model/data.dart';

import '../../model/salle.dart';

class ListSalle extends StatefulWidget
{
  ListSalle({Key? key,required this.salles}):super(key: key);
  final List<Salle> salles;
  @override
  State<ListSalle> createState() => _ListSalleState();
}
class _ListSalleState extends State<ListSalle>
{

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: widget.salles.length,
      itemBuilder: (context, index){
        final item = widget.salles[index];
          return ListTileSalle(salle: item);
        },
    );
  }
}