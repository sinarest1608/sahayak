import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  final count = 0.obs;

  RxList res = [].obs;
  // runF() async {
  //   res = await controller.getProperties();
  // }

  getProperties() async {
    log("start");
    var url = Uri.parse(
        "https://bayut.p.rapidapi.com/properties/list?locationExternalIDs=5002&purpose=for-sale&hitsPerPage=6");
    var response = await http.get(url, headers: {
      'x-rapidapi-host': 'bayut.p.rapidapi.com',
      'x-rapidapi-key': 'c64f38dfefmsh69875933d1b9caep14e3ddjsn2adf8806a2a5'
    });
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    //log(jsonResponse.toString());
    log(jsonResponse["hits"][0]["purpose"].toString());
    res.value = jsonResponse["hits"];

    print(res);
  }

  @override
  void onInit() {
    //getProperties();

    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
