import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

class ListingView extends GetView {
  int? id = 0;
  String? title = "";
  String? rent = "0";
  String? description = "";
  int? percMatch = 90;
  String? area = "900";
  String? rooms = "3";
  String? baths = "3";
  List? keywords = [];

  ListingView(
      {this.id,
      this.title,
      this.description,
      this.rent,
      this.percMatch,
      this.area,
      this.rooms,
      this.baths,
      this.keywords});
  List<Widget>? items = [
    OctoImage.fromSet(
      image: NetworkImage(
        "https://bayut-production.s3.eu-central-1.amazonaws.com/image/183615390/901b83bde9ed43639c3b4c2ff1f5d4cc",
      ),
      fit: BoxFit.cover,
      octoSet: OctoSet.blurHash('LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
    ),
    OctoImage.fromSet(
      image: NetworkImage(
        "https://bayut-production.s3.eu-central-1.amazonaws.com/image/183615390/901b83bde9ed43639c3b4c2ff1f5d4cc",
      ),
      fit: BoxFit.cover,
      octoSet: OctoSet.blurHash('LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
    ),
    OctoImage.fromSet(
      image: NetworkImage(
        "https://bayut-production.s3.eu-central-1.amazonaws.com/image/183615390/901b83bde9ed43639c3b4c2ff1f5d4cc",
      ),
      fit: BoxFit.cover,
      octoSet: OctoSet.blurHash('LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
    ),
    OctoImage.fromSet(
      image: NetworkImage(
        "https://bayut-production.s3.eu-central-1.amazonaws.com/image/183615390/901b83bde9ed43639c3b4c2ff1f5d4cc",
      ),
      fit: BoxFit.cover,
      octoSet: OctoSet.blurHash('LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
    )
  ];

  RxBool isLoading = false.obs;
  Map<String, dynamic> res = {};
  String desc = "";
  getDetails() async {
    isLoading.value = true;
    print(id);
    var url = Uri.parse(
        "https://bayut.p.rapidapi.com/properties/detail?externalID=$id");
    var response = await http.get(url, headers: {
      'x-rapidapi-host': 'bayut.p.rapidapi.com',
      'x-rapidapi-key': 'c64f38dfefmsh69875933d1b9caep14e3ddjsn2adf8806a2a5'
    });
    if (response.body != "") {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      //log(jsonResponse.toString());
      // log(jsonResponse["hits"][0]["purpose"].toString());
      res = jsonResponse;
    }
    print(res["photos"]);
    desc = res["description"];
    if (res != null && res != {} && res["photos"] != null) {
      items!.clear();
      res["photos"].forEach((ele) {
        items!.add(OctoImage.fromSet(
          image: NetworkImage(
            ele["url"],
          ),
          fit: BoxFit.cover,
          octoSet: OctoSet.blurHash('LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
        ));
      });
    }

    isLoading.value = false;
  }

  RxInt _current = 0.obs;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    getDetails();

    return Obx(() => Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              launch("https://www.swamprentals.com");
            },
            isExtended: true,
            label: Row(
              children: [
                Icon(Icons.public),
                Text("Visit Website"),
              ],
            ),
          ),
          body: SafeArea(
            child: isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                              carouselController: _controller,
                              items: items,
                              options: CarouselOptions(
                                height: 400,
                                aspectRatio: 2.0,
                                viewportFraction: 1.0,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: false,
                                //onPageChanged: callbackFunction,
                                scrollDirection: Axis.horizontal,
                                pageSnapping: true,
                                disableCenter: false,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back_ios))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          leading: Container(
                            //height: 100,
                            width: Get.width * 0.5,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: OctoImage.fromSet(
                                          image: NetworkImage(
                                            "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541",
                                          ),
                                          fit: BoxFit.cover,
                                          octoSet: OctoSet.blurHash(
                                              'LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
                                        ),
                                      ),
                                    ),
                                    //Image.asset("") //TODO: Add verifed Image
                                  ],
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Alex, \nVerified User",
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          title: Text(
                            "\$$rent /month",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: Get.width * 0.075,
                        indent: Get.width * 0.075,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 8, left: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title
                                .toString()
                                .replaceAll("DUBAI", "")
                                .replaceAll("Dubai", ""),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 15, left: 30, right: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            desc
                                .replaceAll("DUBAI", "")
                                .replaceAll("Dubai", ""),
                            // "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 15, left: 30, right: 30),
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Accomodation",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.card_giftcard,
                                          color: Colors.orange[900],
                                        ),
                                        Text(
                                          "$percMatch%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(" match"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text(
                                            "${(double.parse(area!) * 10).toStringAsFixed(2)} sq. ft.")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text("${rooms ?? 3} Bedrooms")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text("${baths ?? 3} Baths")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text("Patio")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text("Elevator")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text("Furnished")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text("Lounge")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.green,
                                        ),
                                        Text("New")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.1,
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: items!.asMap().entries.map((entry) {
                      //     return GestureDetector(
                      //       onTap: () => _controller.animateToPage(entry.key),
                      //       child: Container(
                      //         width: 12.0,
                      //         height: 12.0,
                      //         margin: EdgeInsets.symmetric(
                      //             vertical: 8.0, horizontal: 4.0),
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: (Theme.of(context).brightness ==
                      //                         Brightness.dark
                      //                     ? Colors.white
                      //                     : Colors.black)
                      //                 .withOpacity(
                      //                     _current.value == entry.key ? 0.9 : 0.4)),
                      //       ),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
          ),
        ));
  }
}
