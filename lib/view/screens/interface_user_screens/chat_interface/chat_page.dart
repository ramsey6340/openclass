import 'package:flutter/material.dart';
import 'package:openclass/model/user.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/chat_interface/composants/chat_page_setting.dart';
import '../../../composants/tools_bar.dart';
import '../../../../data/data_message.dart';

class ChatPageUser extends StatefulWidget
{
  ChatPageUser({Key? key, required this.user}):super();
  final User user;
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
          widget.user.firstName,
          Icon(Icons.more_horiz, color: Colors.white,),
          (){
            Navigator.pop(context);
          },
           (){
             _showSettingPage(context, widget.user);
           }
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: kColorSecondary,
              child: ListView.builder(
                reverse: true,
                  itemCount: data_list_messages.length,
                  itemBuilder: (context, index){
                    final item = data_list_messages[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            right: 10
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          decoration: BoxDecoration(
                              color: kColorPrimary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: item.isMe?Radius.circular(20):Radius.circular(0),
                                  bottomRight: Radius.circular(0)
                              )
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width*0.8
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(item.text),
                              Text(item.time)
                            ],
                          ),
                        )
                      ],
                    );
                  },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: kColorAppBar,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.image, size: 30, color: Colors.grey,)),
                Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(color: Colors.grey,),
                          filled: true,
                          fillColor: kColorComposant,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                      ),
                    ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.send, size: 30, color: kColorPrimary,)),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showSettingPage(BuildContext context, User user)
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
          return ChatPageSetting(user: user);
        }
    );
  }
}