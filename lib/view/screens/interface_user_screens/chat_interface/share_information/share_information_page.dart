import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import '../../../../../data/data_current.dart';
import '../../../../composants/tools_bar.dart';
import 'composants/body.dart';
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
          /*Icon(Icons.more_horiz, color: Colors.white,)*/Text(""),
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
          return ShareInformationSetting();
        }
    );
  }
}