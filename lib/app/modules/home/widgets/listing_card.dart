import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

Widget listingCard() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
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
                  "https://bayut-production.s3.eu-central-1.amazonaws.com/image/183615390/901b83bde9ed43639c3b4c2ff1f5d4cc",
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
                Text(
                  "Cozy Apartment 3x3",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "\$350",
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
                  "per month\n + utilities",
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
                  "89%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(" match"),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
