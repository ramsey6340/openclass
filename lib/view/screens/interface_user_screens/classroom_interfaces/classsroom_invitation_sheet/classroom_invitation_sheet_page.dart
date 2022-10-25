import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/CRUD/read.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../controller/classroom_ctrl.dart';
import '../../../../../model/user.dart';
import '../../../../composants/loading.dart';
import '../../../../composants/search_bar.dart';
import '../../../../composants/show_setting_page.dart';
import '../add_friends/composants/contact.dart';
import 'composants/button_share_copy.dart';
import 'composants/header_invitation_sheet.dart';

class ClassroomInvitationSheetPage extends StatefulWidget
{
  @override
  State<ClassroomInvitationSheetPage> createState() => _ClassroomInvitationSheetPageState();
}

class _ClassroomInvitationSheetPageState extends State<ClassroomInvitationSheetPage>
{
  @override
  Read read = Read();
  ClassroomCtrl classroomCtrl = ClassroomCtrl();
  @override
  Widget build(BuildContext context)
   {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _usersStream = db.collection('users').where("id", whereNotIn: current_classroom.membres).snapshots();

    return StreamBuilder(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError) {
          return const Text("Quelque chose s'est mal passé");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: Column(
              children: [
                HeaderInvitationSheet(),
                ButtonShareCopy(),
                SearchBar(listSearch: []),
                Expanded(
                  child:  ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index){
                        final item = UserModel.fromSnapshot(snapshot.data?.docs[index]);
                        return Contact(
                            imgContact: item.imgProfile!,
                            nameContact: item.firstName!+' '+item.lastName!,
                            action: ElevatedButton(
                              child: Text("Ajouter"),
                              onPressed: (){
                                final classRef = db.collection("classrooms").doc(current_classroom.id_classroom);
                                classRef.update({
                                  "membres": FieldValue.arrayUnion([item.id]),
                                });
                                setState(() {
                                  current_classroom.membres?.add(item.id);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kColorPrimary,
                              ),
                            )
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}