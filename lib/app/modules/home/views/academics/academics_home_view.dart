// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak/app/modules/home/views/academics/about_professors_view.dart';
import 'package:sahayak/app/modules/home/views/academics/chat/screen/chat_view.dart';

class AcademicsHomeWidget extends GetView {
  // late String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget buildCourseRow(String courseName) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Text(
              courseName,
              style: TextStyle(
                color: Colors.blue.shade800,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              // style: FlutterFlowTheme.of(context)
              //     .bodyText1
              //     .override(
              //       fontFamily: 'Poppins',
              //       fontSize: 18,
              //     ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ChatScreen(courseName));
                    },
                    child: Text(
                      'Join',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      // style: FlutterFlowTheme.of(context)
                      //     .bodyText1
                      //     .override(
                      //       fontFamily: 'Poppins',
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.normal,
                      //     ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                  child: Text(
                    'View',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    // style: FlutterFlowTheme.of(context)
                    //     .bodyText1
                    //     .override(
                    //       fontFamily: 'Poppins',
                    //       color: FlutterFlowTheme.of(context)
                    //           .secondaryText,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w300,
                    //     ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                        'Academics ',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFEFD2C8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Stream',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              // style:
                              //     FlutterFlowTheme.of(context).bodyText1.override(
                              //           fontFamily: 'Poppins',
                              //           fontWeight: FontWeight.w500,
                              //         ),
                            ),
                            Row(
                              children: [
                                Text('Select an option'),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      buildCourseRow('Course 1'),
                      buildCourseRow('Course 2'),
                      buildCourseRow('Course 3'),
                      buildCourseRow('Course 4'),
                      buildCourseRow('Course 5'),
                      buildCourseRow('Course 6'),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AboutProfessors());
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFACB5E9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Text(
                                  'About Professors',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyText1
                                  //     .override(
                                  //       fontFamily: 'Poppins',
                                  //       color: Colors.black,
                                  //       fontSize: 24,
                                  //       fontWeight: FontWeight.w300,
                                  //     ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ChatScreen('Stream Forum'));
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFACB5E9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Text(
                                  'Stream Forum',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyText1
                                  //     .override(
                                  //       fontFamily: 'Poppins',
                                  //       color: Colors.black,
                                  //       fontSize: 24,
                                  //       fontWeight: FontWeight.w300,
                                  //     ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
