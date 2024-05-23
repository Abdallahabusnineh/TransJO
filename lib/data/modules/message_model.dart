import 'package:transjo/domain/entites/message.dart';

class MessagesModel extends Messages{
  MessagesModel({required super.senderId, required super.receiverId, required super.dateTime, required super.text});

  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(senderId:  json['senderId'], receiverId: json['receiverId'], dateTime:json['dateTime'], text:json['text']);

  }

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "receiverId": receiverId,
      "dateTime": dateTime,
      "text": text,
    };
  }
}