// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:sahayak_flutter/app/modules/home/views/academics/academics_home_view.dart';
import 'package:sahayak_flutter/app/modules/home/views/housing_guide_view.dart';
import 'package:sahayak_flutter/app/utils/google_signin.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff96bbff).withOpacity(0.7),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/image/01.jpg', fit: BoxFit.fitHeight)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff96bbff).withOpacity(0.7),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/image/02.jpg', fit: BoxFit.fitHeight)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff96bbff).withOpacity(0.7),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/image/03.jpg', fit: BoxFit.fitHeight)),
        ),
      ),
    ];
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
              CarouselSlider(
                  carouselController: _controller,
                  items: items,
                  options: CarouselOptions(
                    height: 215,
                    aspectRatio: 1.0,
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
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/image/acad.jpg',
                            fit: BoxFit.cover,
                            width: Get.width,
                            color: Colors.black.withOpacity(0.5),
                            colorBlendMode: BlendMode.darken,
                          )),
                      Padding(
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
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/image/housing.jpg',
                            fit: BoxFit.cover,
                            width: Get.width,
                            color: Colors.black.withOpacity(0.35),
                            colorBlendMode: BlendMode.darken,
                          )),
                      Padding(
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
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
