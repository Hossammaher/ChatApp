import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import '../model/message.dart';
import '../widget/ChatBubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  static String id = 'ChatPage';

  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');

  TextEditingController controller = TextEditingController();

  final scroll_controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];

          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 50,
                  ),
                  const Text("Chat App")
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scroll_controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBubble(message: messageList[index])
                          : ChatBubbleForFriend(message: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      if(value.isNotEmpty){
                        message.add({
                          'message': value,
                          'createdAt': DateTime.now(),
                          'id': email
                        });

                        controller.clear();
                        scroll_controller.animateTo(0,
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeIn);
                      }
                      else{

                      }

                    },
                    decoration: InputDecoration(
                        suffixIcon:  GestureDetector(
                          onTap:() {
                            if(controller.value.text.isNotEmpty){
                              message.add({
                                'message': controller.value.text,
                                'createdAt': DateTime.now(),
                                'id': email
                              });
                              controller.clear();
                              scroll_controller.animateTo(0,
                                  duration: const Duration(microseconds: 500),
                                  curve: Curves.easeIn);
                            }



                          },
                          child: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        hintText: "Send Message",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kPrimaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kPrimaryColor)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Text("Loading");
        }
      },
    );
  }
}
