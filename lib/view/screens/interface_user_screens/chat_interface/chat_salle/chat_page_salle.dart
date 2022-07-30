import 'package:flutter/material.dart';
import 'package:openclass/data/data_current_classroom.dart';
import 'package:openclass/view/constante.dart';
import '../../../../../data/data_current.dart';
import 'composants/chat_page_setting.dart';
import '../../../../composants/tools_bar.dart';
import 'composants/body.dart';

class ChatPageSalle extends StatefulWidget
{
  static String routeName = '/chat_page_salle';
  @override
  State<ChatPageSalle> createState() => _ChatPageUserState();
}

class _ChatPageUserState extends State<ChatPageSalle>
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Icon(Icons.navigate_before),
          current_salle.nameSalle,
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