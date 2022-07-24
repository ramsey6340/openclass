import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/user_profile_page.dart';
import 'package:openclass/view/composants/drawer_component.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';
import 'chat_interface_friends/chat_screens/composants/list_contact_page.dart';
import 'chat_interface_friends/chat_screens/list_friend_page.dart';
import 'classroom_interfaces/choose_create_classroom/choose_create_classroom_page.dart';
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
  late Widget _pageProfile;

  @override
  initState()
  {
    super.initState();
    _currentIndex = 0;
    _pageClass = ListClassroomPage();
    _pageChat = ListFriendPage();
    _pageInfo = NewPage();
    _pageProfile = UserProfilePage();
    _pageList = [_pageClass, _pageChat, _pageInfo,_pageProfile];
    _currentPage = _pageClass;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pageList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: DrawerComponent(),
      appBar: (_currentIndex==0)?appBarClass():(_currentIndex==1)?appBarChat():(_currentIndex==2)?appBarNew():null,
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

   /*   floatingActionButton: (_currentIndex == 0)?FloatingActionButton(
        onPressed: (){
          Scaffold.of(context).openEndDrawer();
        },
        backgroundColor: kColorPrimary,
        child: Icon(Icons.navigate_next, color: Colors.white,),
      ):null,*/
    );
  }

  //le appBar pour mes classes
  AppBar appBarClass()
  {
    return ToolsBar.appBar(
        Text('Modifier',style: TextStyle(fontSize: 20,color: kColorPrimary)),
        'Mes classe',
        Icon(Icons.add_circle_outline_rounded),
            (){
          //traitement pour le boutton 'Modifier'
        },
            (){
          Navigator.pushNamed(context, ChooseCreateClassroomPage.routeName);
        }
    );
  }

  //le appBar pour la chat avec mes amis
  AppBar appBarChat()
  {
    return ToolsBar.appBar(
        Text('Modifier',style: TextStyle(fontSize: 20,color: kColorPrimary)),
        'Discussion',
        Icon(Icons.edit),
            (){
          //traitement pour le boutton 'Modifier'
        },
            (){
          //traitement pour l'icon créer une discussion
              Navigator.pushNamed(context, ListContactPage.routeName);
        }
    );
  }

  //le appBar pour mes classes
  AppBar appBarNew()
  {
    return ToolsBar.appBar(
        Text('Modifier',style: TextStyle(fontSize: 20,color: kColorPrimary)),
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