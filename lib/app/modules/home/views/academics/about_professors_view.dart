import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AboutProfessors extends StatefulWidget {
  @override
  State<AboutProfessors> createState() => _AboutProfessorsState();
}

class _AboutProfessorsState extends State<AboutProfessors> {
  var _isLoading = false;
  List _items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    readJson().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/profdat.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F4FF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Text(
                    'Professors',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            _isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return _items[index]["tDept"] == "Engineering"
                            ? Card(
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 8),
                                child: ListTile(
                                  title: Text(
                                    _items[index]["tFname"] +
                                        " " +
                                        _items[index]["tLname"],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    "Rating: " +
                                        _items[index]["overall_rating"] +
                                        "/5.0".toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 226, 177, 29)),
                                  ),
                                ))
                            : Container();
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
