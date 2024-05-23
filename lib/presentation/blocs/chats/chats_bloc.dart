// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:meta/meta.dart';
// import 'package:quiz_maker/constant/app_constant.dart';
// import 'package:quiz_maker/data/models/message_model.dart';
// import 'package:quiz_maker/data/models/user_info.dart';
//
// part 'chats_event.dart';
//
// part 'chats_state.dart';
//
// class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
//   ChatsBloc() : super(ChatsInitial()) {
//     on<ChatGetAllUsers>(_onChatGetAllUsers);
//     on<ChatSendMessages>(_onChatSendMessages);
//     on<ChatGetMessages>(_onChatGetMessages);
//   }
//
//   List<UserInfoModel> users = [];
//
//   TextEditingController chatController = TextEditingController();
//
//   void _onChatGetAllUsers(
//     ChatGetAllUsers event,
//     Emitter emit,
//   ) async {
//     try {
//       emit(ChatsGetAllUsersLoadingState());
//       users.clear();
//       await FirebaseFirestore.instance.collection("users").get().then((value) {
//         for (int i = 0; i < value.size; i++) {
//           if (value.docs[i].id != docId) {
//             users.add(
//               UserInfoModel.fromJson(value.docs[i].data(), value.docs[i].id),
//             );
//           }
//         }
//       });
//       emit(ChatsGetAllUsersSuccessState());
//     } catch (e) {
//       emit(ChatsGetAllUsersFailState());
//     }
//   }
//
//   void _onChatSendMessages(
//     ChatSendMessages event,
//     Emitter emit,
//   ) async {
//     try {
//       MessageModel messageModel = MessageModel(
//         text: event.text,
//         dateTime: DateTime.now().toString(),
//         receiverId: event.receiverId,
//         senderId: docId,
//       );
//       print(
//           'the message Model we kdkdk ${messageModel.text} ||| ${messageModel.senderId} || ${messageModel.receiverId}');
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(docId)
//           .collection("chat")
//           .doc(event.receiverId)
//           .collection("messages")
//           .add(messageModel.toMap())
//           .then((value) {
//         emit(ChatsSendMessageSuccessState());
//         chatController.clear();
//       }).catchError((e) {
//         emit(ChatsSendMessageFailState());
//       });
//
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(event.receiverId)
//           .collection("chat")
//           .doc(docId)
//           .collection("messages")
//           .add(messageModel.toMap())
//           .then((value) {
//         emit(ChatsSendMessageSuccessState());
//         chatController.clear();
//       }).catchError((e) {
//         emit(ChatsSendMessageFailState());
//       });
//     } catch (e) {
//       emit(ChatsGetAllUsersFailState());
//     }
//   }
//
//   List<MessageModel> messages = [];
//
//
//   void _onChatGetMessages(
//     ChatGetMessages event,
//     Emitter emit,
//   ) async {
//     emit(ChatsGetMessagesLoadingState());
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(docId)
//         .collection("chat")
//         .doc(event.receiverId)
//         .collection("messages")
//         .orderBy("dateTime")
//         .snapshots()
//         .listen((event)  {
//       print('is we reach the enevvvvent ${event.docs}');
//       messages = [];
//       for (var element in event.docs) {
//         print('the message we got it in every element ${element.data()}');
//         messages.add(MessageModel.fromJson(element.data()));
//       }
//       emit(ChatsGetMessagesSuccessState());
//     });
//
//     await Future.delayed(const Duration(seconds: 1), () {
//       emit(ChatsGetMessagesSuccessState());
//     });
//   }
// }
