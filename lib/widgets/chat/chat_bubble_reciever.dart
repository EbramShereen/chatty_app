import 'package:flutter/material.dart';

import 'package:chatty_app/models/chat_model.dart';
import 'package:gap/gap.dart';

class ChatBubbleReciever extends StatelessWidget {
  ChatModel model;

  ChatBubbleReciever({
    super.key,
    required this.model,
  });
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: const BoxDecoration(
              color: Color(0xFF2a3575),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Text(
              model.message,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40, left: 5),
        child: Text(
          '${model.date.hour < 10 ? '0${model.date.hour}' : model.date.hour}:${model.date.minute < 10 ? '0${model.date.minute}' : model.date.minute}',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    ]);
  }
}
