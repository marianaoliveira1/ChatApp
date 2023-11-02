import 'package:chat_messenger/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  //get instance of auth and firestore

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserID = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(senderId: currentUserID, senderEmail: currentUserEmail, receiverId: receiverId, message: message, timestamp: timestamp);

    List<String> ids = [
      currentUserID,
      receiverId
    ];

    ids.sort();

    String chatRoomId = ids.join("_");

    await _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(
          newMessage.toMap(),
        );
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUDerId) {
    List<String> ids = [
      userId,
      otherUDerId
    ];

    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('timestamp', descending: false).snapshots();
  }
}
