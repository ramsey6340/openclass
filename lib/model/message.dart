import 'user.dart';

class Message
{
  User sender;
  User receiver;
  String time;
  String text;
  bool isRead;
  bool isMe;

  Message(this.sender, this.receiver, this.time, this.text, this.isRead, this.isMe);
}