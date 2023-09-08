import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/user_profile_page.dart';
import 'package:openclass/view/composants/drawer_component.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';
import '../../../data/data_current.dart';
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
    _pageClass = ListClassroomPage();
    _pageChat = ListFriendPage();
    _pageInfo = NewPage();
    _pageProfile = UserProfilePage();
    _pageList = [_pageClass, _pageChat, _pageInfo,_pageProfile];
    _currentPage = _pageList[current_menu_index];

  }

  void _onItemTapped(int index) {
    setState(() {
      current_menu_index = index;
      _currentPage = _pageList[current_menu_index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: DrawerComponent(),
      appBar: (current_menu_index==0)?appBarClass():(current_menu_index==1)?appBarChat():(current_menu_index==2)?appBarNew():null,
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.school),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.info),label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: '',),
        ],
        backgroundColor: kColorAppBar,
        selectedItemColor: kColorPrimary,
        currentIndex: current_menu_index,
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