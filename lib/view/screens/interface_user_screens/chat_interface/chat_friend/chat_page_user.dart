import 'package:flutter/material.dart';
import 'package:openclass/data/data_current_classroom.dart';
import 'package:openclass/view/constante.dart';
import 'composants/chat_page_setting.dart';
import '../../../../composants/tools_bar.dart';
import 'composants/body.dart';

class ChatPageUser extends StatefulWidget
{
  static String routeName = '/chat_page_user';
  @override
  State<ChatPageUser> createState() => _ChatPageUserState();
}

class _ChatPageUserState extends State<ChatPageUser>
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Icon(Icons.navigate_before),
          data_current_friend.firstName,
          Icon(Icons.more_horiz, color: Colors.white,),
              (){
            Navigator.pop(context);
          },
              (){
            _showSettingPage(context);
          }
      ),
      body: Body(),
    );
  }

  void _showSettingPage(BuildContext context)
  {
    showModalBottomSheet(
        backgroundColor: kColorDrawer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context){
          return ChatPageSetting();
        }
    );
  }
}