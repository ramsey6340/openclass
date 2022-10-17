import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import '../../../../../data/data_current.dart';
import '../../../../composants/chat_page.dart';
import '../../../../composants/show_setting_page.dart';
import 'composants/chat_page_setting.dart';
import '../../../../composants/tools_bar.dart';

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
          ShowSettingPage.showSettingPage(context, ChatPageSetting());
        }
      ),
      body: Container(
        color: kColorSecondary,
        child: ChatPage(),//Body(),
      ),
    );
  }

}