import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class XyzView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XyzView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'XyzView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  