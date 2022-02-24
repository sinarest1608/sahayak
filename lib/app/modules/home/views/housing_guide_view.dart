import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_flutter/app/modules/home/widgets/listing_card.dart';

// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

class HousingGuideView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F4FF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Our Suggestions",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: ListView(
          //shrinkWrap: true,
          ///physics: ClampingScrollPhysics(),
          children: [
            listingCard(),
            listingCard(),
            listingCard(),
            listingCard(),
          ],
        ),
      ),
    );
  }
}
