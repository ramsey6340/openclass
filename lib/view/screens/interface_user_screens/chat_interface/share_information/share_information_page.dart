import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import '../../../../../data/data_current.dart';
import '../../../../composants/chat_page.dart';
import '../../../../composants/show_setting_page.dart';
import '../../../../composants/tools_bar.dart';
import 'composants/share_information_setting.dart';

class ShareInformationPage extends StatelessWidget
{
  static String routeName = '/share_information_page';

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
            ShowSettingPage.showSettingPage(context, ShareInformationSetting());//_showSettingPage(context);
          }
      ),
      body: Container(
        color: kColorSecondary,
        child: ChatPage(),//Body(),
      ),
    );
  }

}