import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sahayak_flutter/app/modules/home/views/academics/chat/widgets/messages.dart';
import 'package:sahayak_flutter/app/modules/home/views/academics/chat/widgets/new_message.dart';

class ChatScreen extends StatefulWidget {
  final String title;

  ChatScreen(this.title);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Chat App'),
        // ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    // borderColor: Colors.transparent,
                    // borderRadius: 30,
                    // borderWidth: 1,
                    // buttonSize: 60,
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 30,
                    decoration: BoxDecoration(),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      // style: FlutterFlowTheme.of(context).bodyText1.override(
                      //       fontFamily: 'Poppins',
                      //       color: Colors.black,
                      //       fontSize: 24,
                      //       fontWeight: FontWeight.normal,
                      //     ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
