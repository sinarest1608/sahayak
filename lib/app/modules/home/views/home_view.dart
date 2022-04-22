// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahayak/app/modules/home/controllers/home_controller.dart';
import 'package:sahayak/app/modules/home/views/academics/academics_home_view.dart';
import 'package:sahayak/app/modules/home/views/housing_guide_view.dart';
import 'package:sahayak/app/utils/google_signin.dart';
import 'package:octo_image/octo_image.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: GestureDetector(
          onTap: () {
            Get.defaultDialog(
                title: "Gator Carnival",
                middleText:
                    "We are excited to announce that our 'Gator Carnival' event will be taking place at the Reitz Union on April 8th from 6:00 PM to 10:00 PM.\n The event check-in station will be located at the Outdoor Tabling Area. GatorNights is free for all current UF students with a valid Gator 1 Card. There are no guests allowed at this week's event.",
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Nay')),
                  TextButton(onPressed: () {}, child: Text('Yayy!')),
                ]);
          },
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff96bbff).withOpacity(0.7),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                    Image.asset('assets/image/01.jpg', fit: BoxFit.fitHeight)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: GestureDetector(
          onTap: () {
            Get.defaultDialog(
                title: "Gator Giggles",
                middleText:
                    "You’d be a fool to miss these silly events🤪 \n @ufgatordays and @ufgatornights have a fun switcheroo planned for you on April Fools Day!\n GatorNights will take place when the sun is out to play, and GatorDays after dark will make its debut☀️🌙",
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Nay')),
                  TextButton(onPressed: () {}, child: Text('Yayy!')),
                ]);
          },
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff96bbff).withOpacity(0.7),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                    Image.asset('assets/image/02.jpg', fit: BoxFit.fitHeight)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: GestureDetector(
          onTap: () {
            Get.defaultDialog(
                title: "Gator Gala",
                middleText:
                    "This week the whole place will be dressed to the nines and we'll be dancing like we’re made of starlight. 💃🕺\n We are excited to announce that 'Gator Gala' will be taking place at the Reitz Union on January 28th from 7:00 PM to 11:00 PM. We encourage you to come dressed in your best attire or to come as you are.",
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Nay')),
                  TextButton(onPressed: () {}, child: Text('Yayy!')),
                ]);
          },
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff96bbff).withOpacity(0.7),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                    Image.asset('assets/image/03.jpg', fit: BoxFit.fitHeight)),
          ),
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
                    "Greetings,\n${FirebaseAuth.instance.currentUser!.displayName}",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await signInWithGoogle();
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                      backgroundColor: Colors.transparent,
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
