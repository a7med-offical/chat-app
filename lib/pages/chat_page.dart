import 'package:ap/CustomWidget/message_content.dart';
import 'package:ap/model/Message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class chatApp extends StatefulWidget {
  chatApp({super.key, });
  static String id = '3';
  @override
  State<chatApp> createState() => _chatAppState();
}
class _chatAppState extends State<chatApp> {
  ScrollController controle_ = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  addUser() {
    // Call the user's CollectionReference to add a new use
    messages
        .add({
          'full_name': controller.text,
          'creatAt': DateTime.now(),
        // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    // var email = ModelRoute.of(context).settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('creatAt').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // List<QueryDocumentSnapshot<Object?>> query = snapshot.data!.docs;
            List<Message> dataList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              dataList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('chat'),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          controller: controle_,
                          itemCount: dataList.length,
                          itemBuilder: (context, index) {
                            return Align(
                                alignment: Alignment.bottomLeft,
                                child: MessageContent(
                                    ModelMessage: dataList[index]));
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  addUser();
                                  controller.clear();
                                  controle_.animateTo(1000,
                                      duration: Duration(microseconds: 20),
                                      curve: Curves.easeIn);
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.purple,
                                )),
                            hintText: 'send message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    )
                  ],
                ));
          } else {
            return Text('');
          }
        });
  }
}
