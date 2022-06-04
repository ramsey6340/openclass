import 'package:flutter/material.dart';

import '../../composants/drawer_component.dart';
import '../../composants/tools_bar.dart';
import '../../constante.dart';
import 'chat_interface_friends/chat_screens/chat_page.dart';
import 'classroom_interfaces/classroom_screen/list_classroom_page.dart';
import 'news_interface/news_screens/new_page.dart';

class MainScreen extends StatefulWidget
{
  static String routeName = '/main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
{
  late int _currentIndex;
  late Widget _currentPage;
  late List<Widget> _pageList;
  late Widget _pageClass;
  late Widget _pageChat;
  late Widget _pageInfo;
  //late Widget _pageProfile;

  @override
  initState()
  {
    super.initState();
    _currentIndex = 0;
    _pageClass = ListClassroomPage();
    _pageChat = ChatPage();
    _pageInfo = NewPage();
    //_pageProfile = ;
    _pageList = [_pageClass, _pageChat, _pageInfo];
    _currentPage = _pageClass;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pageList[index];
    });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: DrawerComponent(),
      appBar: (_currentIndex==0)?appBarClass():(_currentIndex==1)?appBarChat():appBarNew(),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.school),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.info),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: '',),
        ],
        backgroundColor: kColorAppBar,
        selectedItemColor: kColorPrimary,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        iconSize: 30.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  //le appBar pour mes classes
  AppBar appBarClass()
  {
    return ToolsBar.appBar(
        'Modifier',
        'Mes classe',
        Icon(Icons.add_circle_outline_rounded),
        (){
          //traitement pour le boutton 'Modifier'
        },
        (){
          //traitement pour l'icon ajout de classe
        }
    );
  }

  //le appBar pour la chat avec mes amis
  AppBar appBarChat()
  {
    return ToolsBar.appBar(
        'Modifier',
        'Discussion',
        Icon(Icons.edit),
        (){
          //traitement pour le boutton 'Modifier'
        },
        (){
          //traitement pour l'icon créer une discussion
        }
    );
  }

  //le appBar pour mes classes
  AppBar appBarNew()
  {
    return ToolsBar.appBar(
        'Modifier',
        'Informations',
        Icon(Icons.tune),
            (){
          //traitement pour le boutton 'Modifier'
        },
            (){
          //traitement pour l'icon reglage
        }
    );
  }

}