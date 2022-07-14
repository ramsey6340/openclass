import 'package:flutter/material.dart';
import 'package:openclass/data/data_current_classroom.dart';
import 'package:openclass/view/constante.dart';
import '../../../../composants/tools_bar.dart';
import 'composants/body.dart';
import 'composants/send_document_setting.dart';

class SendDocumentPage extends StatelessWidget
{
  static String routeName = '/send_document_page';

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Icon(Icons.navigate_before),
          data_current_salle.name,
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
          return SendDocumentSetting();
        }
    );
  }
}