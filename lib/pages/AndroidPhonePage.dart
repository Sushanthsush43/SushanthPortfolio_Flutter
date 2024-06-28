import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/IphonePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quotes_provider/quotes_provider.dart';

class AndroidPhonePage extends StatefulWidget {
  const AndroidPhonePage({Key? key}) : super(key: key);

  @override
  State<AndroidPhonePage> createState() => _AndroidPhonePageState();
}

class _AndroidPhonePageState extends State<AndroidPhonePage> {
  double? indicatorValue;
  Timer? timer;
  String formattedDate = DateFormat.yMMMd().format(DateTime.now());
  String quote = '';
  String author = '';
  bool _isSecondTextVisible = true;
  late Timer _timer;
  Color backgroundColor = Color(0xFFE9A89B);

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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 445, right: 530),
              child: Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Life Quotes",
                        style: GoogleFonts.acme(
                          fontSize: 24.0,
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
                            fontSize: 11.0,
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
              padding: const EdgeInsets.only(bottom: 155, right: 530),
              child: Container(
                width: 200,
                height: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
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
                            fontSize: 35.0,
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
                                fontSize: 12.0,
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
              padding: const EdgeInsets.only(top: 140, right: 530),
              child: Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 435, right: 530),
              child: Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 445, left: 510),
              child: Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentTime(),
                        style: GoogleFonts.acme(
                          fontSize: 35.0,
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
              padding: const EdgeInsets.only(bottom: 155, left: 510),
              child: Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      buildColorButton(
                          const Color.fromARGB(255, 172, 103, 103)),
                      buildColorButton(Color(0xFFFFE9D0)),
                      buildColorButton(Color(0xFFA3D8FF)),
                      buildColorButton(Color(0xFF88AB8E)),
                      buildColorButton(Color(0xFF8E7AB5)),
                      buildColorButton(Color(0xFF9BB8CD)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 435, left: 510),
              child: Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 510),
              child: Container(
                width: 200,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color.fromRGBO(4, 1, 5, 1), backgroundColor],
                    stops: [0.15, 2.887],
                    transform: const GradientRotation(4),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 380,
                height: 800,
                child: Stack(
                  children: [
                    // Image Background

                    Image.asset(
                      'assets/android.png',
                      fit: BoxFit.cover,
                    ),

                    // Gradient Overlay
                    Positioned(
                      top: 129,
                      left: 45.5,
                      child: Container(
                        width: 277.5,
                        height: 500,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color.fromRGBO(4, 1, 5, 1),
                              backgroundColor
                            ],
                            stops: [0.15, 0.887],
                            transform: const GradientRotation(3.5),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
            // Add GridView for color buttons
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
              child: const Icon(Icons.adb_rounded),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IphonePage()),
                );
              },
              child: const Icon(Icons.apple),
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
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }

  Widget buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          backgroundColor = color;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
