import 'dart:developer';
import 'dart:math';

import 'package:sahayak/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak/app/modules/home/widgets/listing_card.dart';

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
                      return listingCard(
                          controller.res[index]["id"],
                          controller.res[index]["title"],
                          controller.res[index]["description"] ??
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                          (controller.res[index]["price"] / 100) < 200.00
                              ? ((controller.res[index]["price"] / 100) * 3)
                                  .toString()
                              : (controller.res[index]["price"] / 100)
                                  .toString(),
                          controller.res[index]["rentFrequency"] ?? "",
                          controller.res[index]["coverPhoto"]["url"],
                          (Random().nextInt(98 - 80) + 80).toString(),
                          controller.res[index]["baths"].toString(),
                          controller.res[index]["beds"].toString(),
                          controller.res[index]["area"].toString(),
                          controller.res[index]["keywords"]);
                    },
                  ),
          ),
        ));
  }
}
