// import '../flutter_flow/flutter_flow_drop_down.dart';
// import '../flutter_flow/flutter_flow_icon_button.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AcademicsHomeWidget extends StatefulWidget {
//   const AcademicsHomeWidget({required Key key}) : super(key: key);

//   @override
//   _AcademicsHomeWidgetState createState() => _AcademicsHomeWidgetState();
// }

// class _AcademicsHomeWidgetState extends State<AcademicsHomeWidget> {
//   late String dropDownValue;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: FlutterFlowTheme.of(context).primaryColor,
//         automaticallyImplyLeading: false,
//         leading: FlutterFlowIconButton(
//           borderColor: FlutterFlowTheme.of(context).primaryBackground,
//           borderRadius: 30,
//           borderWidth: 1,
//           buttonSize: 60,
//           fillColor: FlutterFlowTheme.of(context).primaryColor,
//           icon: Icon(
//             Icons.menu,
//             color: FlutterFlowTheme.of(context).primaryBackground,
//             size: 30,
//           ),
//           onPressed: () {
//             print('IconButton pressed ...');
//           },
//         ),
//         title: Text(
//           'Academics',
//           style: FlutterFlowTheme.of(context).bodyText1.override(
//                 fontFamily: 'Poppins',
//                 color: FlutterFlowTheme.of(context).primaryBackground,
//                 fontSize: 24,
//               ),
//         ),
//         actions: [],
//         centerTitle: true,
//         elevation: 4,
//       ),
//       backgroundColor: Color(0xFFF5F5F5),
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: FlutterFlowTheme.of(context).alternate,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text(
//                           'Stream',
//                           style: FlutterFlowTheme.of(context).bodyText1,
//                         ),
//                         FlutterFlowDropDown(
//                           options:
//                               ['CSE', 'Architecture', 'Mechanical'].toList(),
//                           onChanged: (val) =>
//                               setState(() => dropDownValue = val),
//                           width: 180,
//                           height: 50,
//                           textStyle:
//                               FlutterFlowTheme.of(context).bodyText1.override(
//                                     fontFamily: 'Poppins',
//                                     color: Colors.black,
//                                   ),
//                           hintText: 'Please select...',
//                           fillColor: Colors.white,
//                           elevation: 2,
//                           borderColor: Colors.transparent,
//                           borderWidth: 0,
//                           borderRadius: 0,
//                           margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//                           hidesUnderline: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 1,
//                 decoration: BoxDecoration(
//                   color: Color(0xFFEEEEEE),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                             child: Text(
//                               'Course 1',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 18,
//                                   ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'Join',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'View',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .secondaryText,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                             child: Text(
//                               'Course 2',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 18,
//                                   ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'Join',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'View',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .secondaryText,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                             child: Text(
//                               'Course 3',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 18,
//                                   ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'Join',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'View',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .secondaryText,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                             child: Text(
//                               'Course 4',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 18,
//                                   ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'Join',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'View',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .secondaryText,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                             child: Text(
//                               'Course 5',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 18,
//                                   ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'Join',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'View',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .secondaryText,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                             child: Text(
//                               'Course 6',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 18,
//                                   ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'Join',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       4, 4, 4, 4),
//                                   child: Text(
//                                     'View',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyText1
//                                         .override(
//                                           fontFamily: 'Poppins',
//                                           color: FlutterFlowTheme.of(context)
//                                               .secondaryText,
//                                           fontSize: 18,
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Material(
//                         color: Colors.transparent,
//                         elevation: 12,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context).primaryText,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               width: 4,
//                             ),
//                           ),
//                           child: Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
//                             child: Text(
//                               'About Professors',
//                               textAlign: TextAlign.center,
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     fontSize: 24,
//                                   ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//                       child: Material(
//                         color: Colors.transparent,
//                         elevation: 12,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: FlutterFlowTheme.of(context).primaryText,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               width: 4,
//                             ),
//                           ),
//                           child: Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
//                             child: Text(
//                               'Stream Forum',
//                               textAlign: TextAlign.center,
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyText1
//                                   .override(
//                                     fontFamily: 'Poppins',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     fontSize: 24,
//                                   ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
