import 'package:flutter/material.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/model/data.dart';
import 'package:openclass/routes.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'model/enum_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Classroom>(
              create: (_) => Classroom(1, '', '', '', '', issa),
          ),
          /*
          ChangeNotifierProvider(
              create: (_) => CategorySalle(1, '', '', '', EnumCategorySalle.information, list_salle_info, classrooms[0]),
          ),*/
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: MainScreen(),
        //initialRoute: WelcomePage.routeName,
        routes: routes,
      ),
    );
  }
}

