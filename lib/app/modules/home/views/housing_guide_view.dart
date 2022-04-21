import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:sahayak_flutter/app/modules/home/widgets/listing_card.dart';

// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

class HousingGuideView extends GetView {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // log(res["purpose"].toString());
    controller.getProperties();
    return Obx(() => Scaffold(
          backgroundColor: Color(0xffF1F4FF),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Our Suggestions",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Container(
            height: Get.height,
            width: Get.width,
            child: controller.res.length == 0
                ? Center(
                    child: Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator()),
                  )
                : ListView.builder(
                    //shrinkWrap: true,
                    ///physics: ClampingScrollPhysics(),
                    itemCount: controller.res.length,
                    itemBuilder: (context, index) {
                      log(controller.res[index]["title"] +
                              controller.res[index]["price"].toString() ??
                          "0" + controller.res[index]["rentFrequency"]);
                      return listingCard(
                          controller.res[index]["title"],
                          controller.res[index]["price"].toString(),
                          controller.res[index]["rentFrequency"] ?? "",
                          controller.res[index]["coverPhoto"]["url"]);
                    },
                  ),
          ),
        ));
  }
}
