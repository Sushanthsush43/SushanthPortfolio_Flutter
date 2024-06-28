import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/AndroidPhonePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quotes_provider/quotes_provider.dart';

class IphonePage extends StatefulWidget {
  const IphonePage({super.key});

  @override
  State<IphonePage> createState() => _IphonePageState();
}

class _IphonePageState extends State<IphonePage> {
  double? indicatorValue;
  Timer? timer;
  String formattedDate = DateFormat.yMMMd().format(DateTime.now());
  String quote = '';
  String author = '';
  bool _isSecondTextVisible = true;
  late Timer _timer;

  void fetchQuote() async {
    final dailyQuotesProvider = DailyQuotesProvider();
    final dailyQuote = await dailyQuotesProvider.getDailyQuote();
    setState(() {
      quote = dailyQuote.quote;
      author = dailyQuote.author;
    });
  }

  String currentTime() {
    return "${DateTime.now().hour < 10 ? "0${DateTime.now().hour}" : DateTime.now().hour} : "
        "${DateTime.now().minute < 10 ? "0${DateTime.now().minute}" : DateTime.now().minute} : "
        "${DateTime.now().second < 10 ? "0${DateTime.now().second}" : DateTime.now().second}";
  }

  void updateSeconds() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(() {
        indicatorValue = DateTime.now().second / 60;
      }),
    );
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _isSecondTextVisible = !_isSecondTextVisible;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchQuote();
    indicatorValue = DateTime.now().second / 60;
    updateSeconds();
    _startAnimation();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
    _startAnimation();
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Life Quotes",
                        style: GoogleFonts.acme(
                          fontSize: 20.0,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        quote,
                        style: GoogleFonts.acme(
                          fontSize: 15.0,
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          '- $author',
                          style: GoogleFonts.acme(
                            fontSize: 10.0,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
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
              padding: const EdgeInsets.only(bottom: 140, right: 530),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(seconds: 1),
                      top: _isSecondTextVisible ? 7 : 50,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          "Hello",
                          style: GoogleFonts.acme(
                            fontSize: 30.0,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 10,
                      left: 10,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: AnimatedOpacity(
                            opacity: _isSecondTextVisible ? 1.0 : 0,
                            duration: const Duration(seconds: 1),
                            child: Text(
                              "My name is Sushanth, I'm a Full Stack Intern at Mobiezy Solutions, Bangalore, with an MCA.",
                              style: GoogleFonts.acme(
                                fontSize: 10.0,
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          formattedDate,
                          style: GoogleFonts.acme(
                            fontSize: 20.0,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
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
              'assets/iphone.png',
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
                  buildImageContainer('assets/project.png', 'My Projects'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/linkein.jpg', 'LinkedIn'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/github.png', 'Github'),
                ],
              ),
            ),
            Positioned(
              top: 265,
              left: 245,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImageContainer('assets/gmail.jpg', 'Gmail'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/certficate.png', 'Certificate'),
                  const SizedBox(width: 30),
                  buildImageContainer('assets/orcid.png', 'OrcId'),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AndroidPhonePage()),
                );
              },
              child: Icon(Icons.adb_rounded),
            ),
            FloatingActionButton(
              onPressed: () {},
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
              color: const Color.fromARGB(
                  255, 0, 0, 0)), // Customize text style as needed
        ),
      ],
    );
  }
}
