import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';

class BottomNavigationBarTools extends StatefulWidget
{
  @override
  State<BottomNavigationBarTools> createState() => _BottomNavigationBarToolsState();
}

class _BottomNavigationBarToolsState extends State<BottomNavigationBarTools>
{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.school),label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.chat),label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.info),label: '',),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: '',),
      ],
      backgroundColor: kColorAppBar,
      selectedItemColor: kColorPrimary,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 30.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 0.0,
      unselectedFontSize: 0.0,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
    );
  }
}