// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:sahayak_flutter/app/modules/home/views/academics_home_view.dart';
import 'package:sahayak_flutter/app/modules/home/views/housing_guide_view.dart';
import 'package:sahayak_flutter/app/utils/google_signin.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    final CarouselController _controller = CarouselController();
    return Scaffold(
        backgroundColor: Color(0xffF1F4FF),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xffF1F4FF),
          title: Text(
            "Sahayak",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 18, right: 18),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Greetings,\nRajdev Kapoor",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await signInWithGoogle();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "🗓️ Happening Today",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 165,
              //     autoPlay: true,
              //   ),
              //   items: [1, 2, 3, 4, 5].map((i) {
              //     return Builder(
              //       builder: (BuildContext context) {
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 1),
              //           child: Container(
              //             width: Get.width,
              //             height: 165,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               color: Color(0xff96bbff).withOpacity(0.7),
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   }).toList(),
              // ),

              CarouselSlider(
                  carouselController: _controller,
                  items: items,
                  options: CarouselOptions(
                    height: 165,
                    aspectRatio: 2.0,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    //onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    disableCenter: false,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "👋 How can we help you today?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AcademicsHomeWidget());
                },
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "🏫",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Academics\nGuide",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => HousingGuideView());
                },
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "🏡",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Housing\nGuide",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}
