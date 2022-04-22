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
                          color: Color.fromARGB(255, 1, 91, 6),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffF1F4FF),
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
                padding: const EdgeInsets.all(14),
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
                    child: Center(
                      child: Text(
                        'Select Fall 22 Course and Join the Group',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
                    buildCourseRow('COT5405'),
                    buildCourseRow('CIS4301'),
                    buildCourseRow('CEN5035'),
                    buildCourseRow('CAP5100'),
                    buildCourseRow('C0T5480'),
                    buildCourseRow('CES3213'),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AboutProfessors());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Container(
                          width: Get.width,
                          height: 157,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffe8eaff).withOpacity(0.7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/image/prof.jpg',
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    color: Colors.black.withOpacity(0.5),
                                    colorBlendMode: BlendMode.darken,
                                  )),
                              Container(
                                child: Center(
                                  child: Text(
                                    "About Professors",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ChatScreen('Stream Forum'));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Container(
                          width: Get.width,
                          height: 157,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xfffee8eb),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/image/chat.jpg',
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    color: Colors.black.withOpacity(0.35),
                                    colorBlendMode: BlendMode.darken,
                                  )),
                              Container(
                                child: Center(
                                  child: Text(
                                    "Stream Forum",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
