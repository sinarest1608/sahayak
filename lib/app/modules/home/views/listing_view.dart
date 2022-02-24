import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class ListingView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListingView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  