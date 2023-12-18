import 'package:chat_messenger/services/chat/chat_service.dart';
import 'package:chat_messenger/widgets/chat_dubble.dart';
import 'package:chat_messenger/widgets/default_text_filed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;

  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          SizedBox(
            height: 25.h,
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading..');
        }

        return ListView(
          children: snapshot.data!.docs
              .map(
                (document) => _buildMessageItem(document),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            (data['senderId'] == _firebaseAuth.currentUser!.uid)
                ? Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.6.sw.toDouble(),
                    ),
                    padding: EdgeInsets.all(12.0.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4575f1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text(
                        //   data['senderEmail'],
                        //   style: TextStyle(color: Colors.white, fontSize: 8.sp),
                        // ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        ChatBubble(
                          message: data['message'],
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                : Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.6.sw.toDouble(),
                    ),
                    padding: EdgeInsets.all(12.0.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text(
                        //   data['senderEmail'],
                        //   style: TextStyle(color: Colors.black, fontSize: 8.sp),
                        // ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        ChatBubble(
                          message: data['message'],
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.h),
      child: Row(
        children: [
          Expanded(
            child: DefaultTextField(
                controller: _messageController,
                hintText: 'Enter message',
                obscureText: false),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_upward),
            onPressed: sendMessage,
          )
        ],
      ),
    );
  }
}
