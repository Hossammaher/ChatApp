import 'package:flutter/material.dart';

import '../Constants.dart';
import '../model/message.dart';

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(32),
            child: Text(
              message.message,
              style: const TextStyle(color: Colors.white),
            ),
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(message.id, style: const TextStyle(fontSize: 8)),
            )),
     ]
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child:
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(32),
                child: Text(
                  message.message,
                  style: const TextStyle(color: Colors.white),
                ),
                decoration: const BoxDecoration(
                    color: Color(0xff006D84),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
              ),

        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(message.id, style: const TextStyle(fontSize: 8)),
            ))
      ],
    );
  }
}
