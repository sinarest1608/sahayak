// import 'package:chat_app/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahayak_flutter/app/modules/home/views/academics/chat/widgets/message_bubble.dart';

class Messages extends StatefulWidget {
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  var firebaseUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseUser = FirebaseAuth.instance.currentUser;
  }

  Future<String> getUserId() async {
    // ignore: await_only_futures
    firebaseUser = await FirebaseAuth.instance.currentUser;
    return firebaseUser.uid;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserId(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy(
                    'createdAt',
                    descending: true,
                  )
                  .snapshots(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final chatDocs = chatSnapshot.data?.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs!.length,
                  itemBuilder: (ctx, index) => MessageBubble(
                    chatDocs[index]['text'],
                    chatDocs[index]['username'],
                    chatDocs[index]['userImage'],
                    chatDocs[index]['userId'] == futureSnapshot.data.toString(),
                    key: ValueKey(chatDocs[index].id),
                  ),
                );
              });
        });
  }
}
