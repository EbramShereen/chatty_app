import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String message;
  String id;
  DateTime date;
  ChatModel({
    required this.message,
    required this.id,
    required this.date,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      date: json['date'] != null
          ? (json['date'] as Timestamp).toDate()
          : DateTime.now(),
      message: json['message'],
      id: json['id'],
    );
  }
}
