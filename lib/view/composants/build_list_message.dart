import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:openclass/view/composants/show_document.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../../../data/data_current.dart';
import '../../../../../../model/message.dart';
import '../constante.dart';
import 'loading.dart';

class BuildListMessage extends StatefulWidget
{
  @override
  State<BuildListMessage> createState() => _BuildListMessageState();
}

class _BuildListMessageState extends State<BuildListMessage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _chatFriendStream  = db.collection("chats").doc(current_group_id).collection(current_group_id).orderBy("date_creation", descending: true).snapshots();
    return StreamBuilder(
      stream: _chatFriendStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Quelque chose s'est mal passé");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return Expanded(
          child: Container(
            color: kColorSecondary,
            child: ListView.builder(
              reverse: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index){
                final item = Message.fromSnapshot(snapshot.data?.docs[index]);
                return (item.typeMessage == "text")?BubbleSpecialThree(
                  text: item.content!,
                  textStyle: TextStyle(color: Colors.white),
                  isSender: (item.sender_id==current_user.id)?true:false,
                  color: (item.sender_id==current_user.id)?kColorPrimary:Colors.black38,
                  tail: true,
                  sent: true,
                ): (item.typeMessage == "image")?Container(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  alignment: (item.sender_id == current_user.id)? Alignment.centerRight:Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => Navigator.push(context, 
                        MaterialPageRoute(builder: (_) => ShowImage(imageUrl: item.content!))
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height/2.5,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                          border: Border.all()
                      ),
                      alignment: (item.content != "")?Alignment.center:null,
                      child: (item.content != "")? Image.network(item.content!, fit: BoxFit.scaleDown,):CircularProgressIndicator(color: Colors.blue,),
                    ),
                  ),
                ) :InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => ShowDocument(doc_path: item.content!,),
                  )),
                  child: Container(
                    child: SfPdfViewer.network(item.content!,
                        pageLayoutMode: PdfPageLayoutMode.single),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class ShowImage extends StatelessWidget {
  const ShowImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Image.network(imageUrl),
    );
  }
}


