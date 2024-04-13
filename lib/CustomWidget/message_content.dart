import 'package:ap/model/Message.dart';
import 'package:flutter/material.dart';

class MessageContent extends StatelessWidget {
  MessageContent({Key? key, required this.ModelMessage}) : super(key: key);

  final Message ModelMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(top: 25, bottom: 25, left: 5, right: 20),
      decoration: const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Text(
        ModelMessage.full_name, // Access the full_name property as a String
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}