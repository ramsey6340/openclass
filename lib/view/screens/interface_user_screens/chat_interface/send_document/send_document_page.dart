import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import '../../../../../data/data_current.dart';
import '../../../../composants/chat_page.dart';
import '../../../../composants/show_setting_page.dart';
import '../../../../composants/tools_bar.dart';
import 'composants/send_document_setting.dart';

class SendDocumentPage extends StatelessWidget
{
  static String routeName = '/send_document_page';

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
            ShowSettingPage.showSettingPage(context, SendDocumentSetting());
          }
      ),
      body: Container(
        color: kColorSecondary,
        child: ChatPage(),//Body(),
      ),
    );
  }

}