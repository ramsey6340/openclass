import 'package:flutter/material.dart';
import '../constante.dart';

/// Cette classe contient la methode qui permet de retourner la page de reglage des differents page de chat

class ShowSettingPage
{

  static void showSettingPage(BuildContext context, Widget setting_page)
  {
    showModalBottomSheet(
        backgroundColor: kColorDrawer,
        shape: kSettingChatPageShape,
        isScrollControlled: true,
        context: context,
        builder: (context){
          return setting_page;
        }
    );
  }
}