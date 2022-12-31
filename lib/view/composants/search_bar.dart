import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

/// Widget pour créer une barre de recherche

class SearchBar extends StatelessWidget
{
  SearchBar({Key? key, required this.listSearch}):super(key: key);
  List<String> listSearch;
  @override
  Widget build(BuildContext context) {
    TextEditingController? _controller = TextEditingController();
    return Column(
      children: [
        const SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            color: kColorSearch,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Rechercher',
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search,color: Colors.white,),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onChanged: (valueSearch){
              listSearch = listSearch.where((element) => element.contains(valueSearch)).toList();
            },
          ),
        ),
        const SizedBox(height: 10,),
        const Divider(height: 3,color: Colors.white,)
      ],
    );
  }
}