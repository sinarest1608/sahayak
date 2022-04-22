import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:sahayak/app/modules/home/views/listing_view.dart';

// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

Widget listingCard(
    int id,
    String title,
    String description,
    String price,
    String rentFreq,
    String url,
    String perMatch,
    String baths,
    String beds,
    String area,
    List keywords) {
  log(title + rentFreq + price);
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () {
        Get.to(() => ListingView(
              id: id,
              title: title,
              description: description,
              percMatch: int.parse(perMatch),
              rent: price,
              baths: baths,
              rooms: beds,
              area: area,
              keywords: keywords,
            ));
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.3,
              width: Get.width * 0.95,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                // child: Image.network(
                //   "https://bayut-production.s3.eu-central-1.amazonaws.com/image/183615390/901b83bde9ed43639c3b4c2ff1f5d4cc",
                //   fit: BoxFit.contain,
                // ),
                child: OctoImage.fromSet(
                  image: NetworkImage(
                    url,
                  ),
                  fit: BoxFit.cover,
                  octoSet: OctoSet.blurHash('LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
                ),
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text(
                    "\$$price",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 15, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Looking for tenants as soon as possible",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    "$rentFreq\n + utilities",
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 8, bottom: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.orange[900],
                  ),
                  Text(
                    "$perMatch%",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(" match"),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
