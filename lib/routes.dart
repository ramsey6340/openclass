import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/chat_interface_friends/chat_screens/list_friend_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_friends/add_friends_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/choose_create_classroom/choose_create_classroom_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/classroom_screen/list_classroom_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_category/create_category_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_classroom/create_classroom_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_salle/create_salle_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/join_classroom/join_classroom_page.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'package:openclass/view/screens/login_screens/authentication/authentication_page.dart';
import 'package:openclass/view/screens/login_screens/confirmation/confirmation_page.dart';
import 'package:openclass/view/screens/login_screens/forgot_password/forgot_password_page.dart';
import 'package:openclass/view/screens/login_screens/reset_password/reset_password_page.dart';
import 'package:openclass/view/screens/login_screens/sign_in/sign_in_page.dart';
import 'package:openclass/view/screens/login_screens/sign_up/sign_up_page.dart';
import 'package:openclass/view/screens/login_screens/sign_up_success/sign_up_success_page.dart';
import 'package:openclass/view/screens/login_screens/welcome/welcome_page.dart';

final Map<String,WidgetBuilder> routes = {
  WelcomePage.routeName: (context) => WelcomePage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
  ResetPasswordPage.routeName: (context) => ResetPasswordPage(),
  SignUpSuccessPage.routeName: (context) => SignUpSuccessPage(),
  AuthenticationPage.routename: (context) => AuthenticationPage(),
  ConfirmationPage.routename: (context) => ConfirmationPage(),
  ListClassroomPage.routeName: (context) => ListClassroomPage(),
  ListFriendPage.routeName: (context) => ListFriendPage(),
  MainScreen.routeName: (context) => MainScreen(),
  ChooseCreateClassroomPage.routeName: (context) => ChooseCreateClassroomPage(),
  CreateClassroomPage.routeName: (context) => CreateClassroomPage(),
  JoinClassroomPage.routeName: (context) => JoinClassroomPage(),
  CreateSallePage.routeName: (context) => CreateSallePage(),
  CreateCategoryPage.routeName: (context) => CreateCategoryPage(),
  AddFriendsPage.routeName: (context) => AddFriendsPage(),
};