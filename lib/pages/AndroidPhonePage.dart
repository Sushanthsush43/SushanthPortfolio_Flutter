import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/IphonePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AndroidPhonePage extends StatefulWidget {
  const AndroidPhonePage({Key? key}) : super(key: key);

  @override
  State<AndroidPhonePage> createState() => _AndroidPhonePageState();
}

class _AndroidPhonePageState extends State<AndroidPhonePage> {
  double? indicatorValue;
  Timer? timer;
  String formattedDate = DateFormat.yMMMd().format(DateTime.now());

  String currentTime() {
    return "${DateTime.now().hour < 10 ? "0${DateTime.now().hour}" : DateTime.now().hour} : "
        "${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute} : "
        "${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second}";
  }

  void updateSeconds() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(() {
        indicatorValue = DateTime.now().second / 60;
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    indicatorValue = DateTime.now().second / 60;
    updateSeconds();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 410, right: 530),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 140, right: 530),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130, right: 530),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, right: 530),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 410, left: 510),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentTime(),
                        style: GoogleFonts.acme(
                          fontSize: 40.0,
                          textStyle: TextStyle(color: Colors.black),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          formattedDate,
                          style: GoogleFonts.acme(
                            fontSize: 20.0,
                            textStyle: TextStyle(color: Colors.black),
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 140, left: 510),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 510),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 510),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
              ),
            ),
            Image.asset(
              'assets/android.png',
              height: 650.0,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 85,
              left: 245,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Hackerrank'),
                  const SizedBox(width: 20),
                  buildImageContainer(
                    'assets/leetcode.png',
                    'Leetcode',
                  ),
                  const SizedBox(width: 20),
                  buildImageContainer('assets/abtme.png', 'About me'),
                ],
              ),
            ),
            Positioned(
              top: 175,
              left: 240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Text 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
            Positioned(
              top: 265,
              left: 245,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Text 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
            Positioned(
              top: 355,
              left: 245,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Text 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
            Positioned(
              top: 445,
              left: 245,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/hacker.png', 'Text 1'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/hacker.png', 'about'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.adb_rounded),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IphonePage()),
                );
              },
              child: Icon(Icons.apple),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageContainer(String imagePath, String text) {
    return Column(
      children: [
        Container(
          width: 55.0,
          height: 55.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            // border: Border.all(color: Colors.black, width: 2),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.5),
            //     spreadRadius: 2,
            //     blurRadius: 5,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            // ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5), // Space between image and text
        Text(
          text,
          style: TextStyle(
              fontSize: 13,
              color: const Color.fromARGB(
                  255, 0, 0, 0)), // Customize text style as needed
        ),
      ],
    );
  }
}
